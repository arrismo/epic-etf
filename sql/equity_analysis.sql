CREATE TABLE bonds.equity_analysis AS
SELECT
    date,
    EXTRACT(MONTH FROM CAST(date AS DATE)) AS MONTH,
    EXTRACT(YEAR FROM CAST(date AS DATE)) AS YEAR,
    
    -- IEFA calculations
    IEFA,
    LAG(IEFA) OVER (ORDER BY Date) AS Previous_IEFA,
    (IEFA - LAG(IEFA) OVER (ORDER BY Date)) / LAG(IEFA) OVER (ORDER BY Date) * 100 AS IEFA_Pct_Change,
    (IEFA / FIRST_VALUE(IEFA) OVER (ORDER BY Date) - 1) * 100 AS IEFA_Cumulative_Return,
    
    -- IEMG calculations
    IEMG,
    LAG(IEMG) OVER (ORDER BY Date) AS Previous_IEMG,
    (IEMG - LAG(IEMG) OVER (ORDER BY Date)) / LAG(IEMG) OVER (ORDER BY Date) * 100 AS IEMG_Pct_Change,
    (IEMG / FIRST_VALUE(IEMG) OVER (ORDER BY Date) - 1) * 100 AS IEMG_Cumulative_Return,
    
    -- IJH calculations
    IJH,
    LAG(IJH) OVER (ORDER BY Date) AS Previous_IJH,
    (IJH - LAG(IJH) OVER (ORDER BY Date)) / LAG(IJH) OVER (ORDER BY Date) * 100 AS IJH_Pct_Change,
    (IJH / FIRST_VALUE(IJH) OVER (ORDER BY Date) - 1) * 100 AS IJH_Cumulative_Return,
    
    -- IJR calculations
    IJR,
    LAG(IJR) OVER (ORDER BY Date) AS Previous_IJR,
    (IJR - LAG(IJR) OVER (ORDER BY Date)) / LAG(IJR) OVER (ORDER BY Date) * 100 AS IJR_Pct_Change,
    (IJR / FIRST_VALUE(IJR) OVER (ORDER BY Date) - 1) * 100 AS IJR_Cumulative_Return,
    
    -- IVV calculations
    IVV,
    LAG(IVV) OVER (ORDER BY Date) AS Previous_IVV,
    (IVV - LAG(IVV) OVER (ORDER BY Date)) / LAG(IVV) OVER (ORDER BY Date) * 100 AS IVV_Pct_Change,
    (IVV / FIRST_VALUE(IVV) OVER (ORDER BY Date) - 1) * 100 AS IVV_Cumulative_Return,
    
    -- IWF calculations
    IWF,
    LAG(IWF) OVER (ORDER BY Date) AS Previous_IWF,
    (IWF - LAG(IWF) OVER (ORDER BY Date)) / LAG(IWF) OVER (ORDER BY Date) * 100 AS IWF_Pct_Change,
    (IWF / FIRST_VALUE(IWF) OVER (ORDER BY Date) - 1) * 100 AS IWF_Cumulative_Return,
    
    -- IWM calculations
    IWM,
    LAG(IWM) OVER (ORDER BY Date) AS Previous_IWM,
    (IWM - LAG(IWM) OVER (ORDER BY Date)) / LAG(IWM) OVER (ORDER BY Date) * 100 AS IWM_Pct_Change,
    (IWM / FIRST_VALUE(IWM) OVER (ORDER BY Date) - 1) * 100 AS IWM_Cumulative_Return,
    
    -- QQQ calculations
    QQQ,
    LAG(QQQ) OVER (ORDER BY Date) AS Previous_QQQ,
    (QQQ - LAG(QQQ) OVER (ORDER BY Date)) / LAG(QQQ) OVER (ORDER BY Date) * 100 AS QQQ_Pct_Change,
    (QQQ / FIRST_VALUE(QQQ) OVER (ORDER BY Date) - 1) * 100 AS QQQ_Cumulative_Return,
    
    -- RSP calculations
    RSP,
    LAG(RSP) OVER (ORDER BY Date) AS Previous_RSP,
    (RSP - LAG(RSP) OVER (ORDER BY Date)) / LAG(RSP) OVER (ORDER BY Date) * 100 AS RSP_Pct_Change,
    (RSP / FIRST_VALUE(RSP) OVER (ORDER BY Date) - 1) * 100 AS RSP_Cumulative_Return,

    -- SCHD calculations
    SCHD,
    LAG(SCHD) OVER (ORDER BY Date) AS Previous_SCHD,
    (SCHD - LAG(SCHD) OVER (ORDER BY Date)) / LAG(SCHD) OVER (ORDER BY Date) * 100 AS SCHD_Pct_Change,
    (SCHD / FIRST_VALUE(SCHD) OVER (ORDER BY Date) - 1) * 100 AS SCHD_Cumulative_Return,
    
    -- SPY calculations
    SPY,
    LAG(SPY) OVER (ORDER BY Date) AS Previous_SPY,
    (SPY - LAG(SPY) OVER (ORDER BY Date)) / LAG(SPY) OVER (ORDER BY Date) * 100 AS SPY_Pct_Change,
    (SPY / FIRST_VALUE(SPY) OVER (ORDER BY Date) - 1) * 100 AS SPY_Cumulative_Return,
    
    -- VEA calculations
    VEA,
    LAG(VEA) OVER (ORDER BY Date) AS Previous_VEA,
    (VEA - LAG(VEA) OVER (ORDER BY Date)) / LAG(VEA) OVER (ORDER BY Date) * 100 AS VEA_Pct_Change,
    (VEA / FIRST_VALUE(VEA) OVER (ORDER BY Date) - 1) * 100 AS VEA_Cumulative_Return,
    
    -- VGT calculations
    VGT,
    LAG(VGT) OVER (ORDER BY Date) AS Previous_VGT,
    (VGT - LAG(VGT) OVER (ORDER BY Date)) / LAG(VGT) OVER (ORDER BY Date) * 100 AS VGT_Pct_Change,
    (VGT / FIRST_VALUE(VGT) OVER (ORDER BY Date) - 1) * 100 AS VGT_Cumulative_Return,
    
    -- VIG calculations
    VIG,
    LAG(VIG) OVER (ORDER BY Date) AS Previous_VIG,
    (VIG - LAG(VIG) OVER (ORDER BY Date)) / LAG(VIG) OVER (ORDER BY Date) * 100 AS VIG_Pct_Change,
    (VIG / FIRST_VALUE(VIG) OVER (ORDER BY Date) - 1) * 100 AS VIG_Cumulative_Return,
    
    -- VO calculations
    VO,
    LAG(VO) OVER (ORDER BY Date) AS Previous_VO,
    (VO - LAG(VO) OVER (ORDER BY Date)) / LAG(VO) OVER (ORDER BY Date) * 100 AS VO_Pct_Change,
    (VO / FIRST_VALUE(VO) OVER (ORDER BY Date) - 1) * 100 AS VO_Cumulative_Return,
    
    -- VOO calculations
    VOO,
    LAG(VOO) OVER (ORDER BY Date) AS Previous_VOO,
    (VOO - LAG(VOO) OVER (ORDER BY Date)) / LAG(VOO) OVER (ORDER BY Date) * 100 AS VOO_Pct_Change,
    (VOO / FIRST_VALUE(VOO) OVER (ORDER BY Date) - 1) * 100 AS VOO_Cumulative_Return,
    
    -- VTI calculations
    VTI,
    LAG(VTI) OVER (ORDER BY Date) AS Previous_VTI,
    (VTI - LAG(VTI) OVER (ORDER BY Date)) / LAG(VTI) OVER (ORDER BY Date) * 100 AS VTI_Pct_Change,
    (VTI / FIRST_VALUE(VTI) OVER (ORDER BY Date) - 1) * 100 AS VTI_Cumulative_Return,
    
    -- VTV calculations
    VTV,
    LAG(VTV) OVER (ORDER BY Date) AS Previous_VTV,
    (VTV - LAG(VTV) OVER (ORDER BY Date)) / LAG(VTV) OVER (ORDER BY Date) * 100 AS VTV_Pct_Change,
    (VTV / FIRST_VALUE(VTV) OVER (ORDER BY Date) - 1) * 100 AS VTV_Cumulative_Return,
    
    -- VUG calculations
    VUG,
    LAG(VUG) OVER (ORDER BY Date) AS Previous_VUG,
    (VUG - LAG(VUG) OVER (ORDER BY Date)) / LAG(VUG) OVER (ORDER BY Date) * 100 AS VUG_Pct_Change,
    (VUG / FIRST_VALUE(VUG) OVER (ORDER BY Date) - 1) * 100 AS VUG_Cumulative_Return,
    
    -- VWO calculations
    VWO,
    LAG(VWO) OVER (ORDER BY Date) AS Previous_VWO,
    (VWO - LAG(VWO) OVER (ORDER BY Date)) / LAG(VWO) OVER (ORDER BY Date) * 100 AS VWO_Pct_Change,
    (VWO / FIRST_VALUE(VWO) OVER (ORDER BY Date) - 1) * 100 AS VWO_Cumulative_Return,
    
    -- VXUS calculations
    VXUS,
    LAG(VXUS) OVER (ORDER BY Date) AS Previous_VXUS,
    (VXUS - LAG(VXUS) OVER (ORDER BY Date)) / LAG(VXUS) OVER (ORDER BY Date) * 100 AS VXUS_Pct_Change,
    (VXUS / FIRST_VALUE(VXUS) OVER (ORDER BY Date) - 1) * 100 AS VXUS_Cumulative_Return,
    
    -- XLE calculations
    XLE,
    LAG(XLE) OVER (ORDER BY Date) AS Previous_XLE,
    (XLE - LAG(XLE) OVER (ORDER BY Date)) / LAG(XLE) OVER (ORDER BY Date) * 100 AS XLE_Pct_Change,
    (XLE / FIRST_VALUE(XLE) OVER (ORDER BY Date) - 1) * 100 AS XLE_Cumulative_Return,
    
    -- XLF calculations
    XLF,
    LAG(XLF) OVER (ORDER BY Date) AS Previous_XLF,
    (XLF - LAG(XLF) OVER (ORDER BY Date)) / LAG(XLF) OVER (ORDER BY Date) * 100 AS XLF_Pct_Change,
    (XLF / FIRST_VALUE(XLF) OVER (ORDER BY Date) - 1) * 100 AS XLF_Cumulative_Return,
    
    -- XLG calculations
    XLG,
    LAG(XLG) OVER (ORDER BY Date) AS Previous_XLG,
    (XLG - LAG(XLG) OVER (ORDER BY Date)) / LAG(XLG) OVER (ORDER BY Date) * 100 AS XLG_Pct_Change,
    (XLG / FIRST_VALUE(XLG) OVER (ORDER BY Date) - 1) * 100 AS XLG_Cumulative_Return,
    
    -- XLK calculations
    XLK,
    LAG(XLK) OVER (ORDER BY Date) AS Previous_XLK,
    (XLK - LAG(XLK) OVER (ORDER BY Date)) / LAG(XLK) OVER (ORDER BY Date) * 100 AS XLK_Pct_Change,
    (XLK / FIRST_VALUE(XLK) OVER (ORDER BY Date) - 1) * 100 AS XLK_Cumulative_Return
FROM
    bonds.equity;