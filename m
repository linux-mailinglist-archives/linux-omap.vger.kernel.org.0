Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF43270272F
	for <lists+linux-omap@lfdr.de>; Mon, 15 May 2023 10:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbjEOIbq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 May 2023 04:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234377AbjEOIbN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 May 2023 04:31:13 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D769010C9
        for <linux-omap@vger.kernel.org>; Mon, 15 May 2023 01:28:19 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f41dceb9c9so65111695e9.3
        for <linux-omap@vger.kernel.org>; Mon, 15 May 2023 01:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684139298; x=1686731298;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08wnipZvDvV9LKo/hnrlT7svgYHC8T3eteafRvcM/Mc=;
        b=KbCk1/qOs9Fwzo33x20FErGiITLuK5nG7Zdn6mIHBuxtGRyNHRVILGG/MeR5jevTxq
         mkKdyy9AiNkBloZe2GlkkCF0Ac/RVqYzsMFuWlA4lZNY9fiufLVZ8I9+3Dt75TqIPnlh
         DOz0BkCFxgHUgQsowEj0Np6HJzqo5sgVa0GMBt+r26YHU/nO3ZxsURskjzvqxerK5PkL
         4QSbboobIHVmjK0WxZca2UcofYwjgdQbGZPWnVKs2Z0ECfFmgkRX9Juoti+WR8WiLD9v
         AR/yXA1WDVX3gILCrZ6Y5HM+z4YZCyhmQtH4sNkVxnDycW6Em4jnJHruBTFf6W3pyBxU
         nmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684139298; x=1686731298;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08wnipZvDvV9LKo/hnrlT7svgYHC8T3eteafRvcM/Mc=;
        b=kfkCFeScqmLMnHPFv2S03pS/WFxO6aLGrXdg0tE2fxIGLHix7d85nkv2TO0kWFT8a/
         VGJ2IEp7hxN8wMCX9z/JQOzcEgyRSCn4gfBdA/orffeo7+mK8ZvYI6bMfFP44/BGQsC0
         qDX+mQFsf/6iOWkEz/HXiS4NdAMIrMyfezqXu+fq7OEUXvoBGICogNHBPKJPM2F+Mxhl
         dmjkf2pWD+dJ4vfdwLxf7RT22YpnbV2lij5FboLFW+RAFJKSTbCp/0hfzSXs5mQj50RX
         paKIE3f2ceK87zmsp7mnEFTb+8rXJ9FIvwA7JaYardPC6IUqNKyj+vAukw5gjcWYpiO+
         vozw==
X-Gm-Message-State: AC+VfDw19/74aAL6Aw5o7s7LLiUfsFv6WSM7FKko9jxEk2tCH7avirp1
        xDzurkunHbo42+1wc3zPvW2jsg==
X-Google-Smtp-Source: ACHHUZ54MLdQDwm4CQ73Nj9Y8XhwEMeioRNBdkRuqfGCMU1tJRcII083a9tzfSSDD+8I+WxLpLh+9A==
X-Received: by 2002:a7b:cb53:0:b0:3f2:53a5:d308 with SMTP id v19-20020a7bcb53000000b003f253a5d308mr21950482wmj.6.1684139298322;
        Mon, 15 May 2023 01:28:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003f07ef4e3e0sm28062465wmo.0.2023.05.15.01.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 01:28:16 -0700 (PDT)
Date:   Mon, 15 May 2023 11:28:01 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     tony@atomide.com
Cc:     linux-omap@vger.kernel.org
Subject: [bug report] bus: ti-sysc: Implement display subsystem reset quirk
Message-ID: <a8ec8a68-9c2c-4076-bf47-09fccce7659f@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Tony Lindgren,

The patch 7324a7a0d5e2: "bus: ti-sysc: Implement display subsystem
reset quirk" from Feb 24, 2020, leads to the following Smatch static
checker warning:

	drivers/bus/ti-sysc.c:1806 sysc_quirk_dispc()
	warn: masking a bool

drivers/bus/ti-sysc.c
    1756 static u32 sysc_quirk_dispc(struct sysc *ddata, int dispc_offset,
    1757                             bool disable)
    1758 {
    1759         bool lcd_en, digit_en, lcd2_en = false, lcd3_en = false;
    1760         const int lcd_en_mask = BIT(0), digit_en_mask = BIT(1);
    1761         int manager_count;
    1762         bool framedonetv_irq = true;
    1763         u32 val, irq_mask = 0;
    1764 
    1765         switch (sysc_soc->soc) {
    1766         case SOC_2420 ... SOC_3630:
    1767                 manager_count = 2;
    1768                 framedonetv_irq = false;
    1769                 break;
    1770         case SOC_4430 ... SOC_4470:
    1771                 manager_count = 3;
    1772                 break;
    1773         case SOC_5430:
    1774         case SOC_DRA7:
    1775                 manager_count = 4;
    1776                 break;
    1777         case SOC_AM4:
    1778                 manager_count = 1;
    1779                 framedonetv_irq = false;
    1780                 break;
    1781         case SOC_UNKNOWN:
    1782         default:
    1783                 return 0;
    1784         }
    1785 
    1786         /* Remap the whole module range to be able to reset dispc outputs */
    1787         devm_iounmap(ddata->dev, ddata->module_va);
    1788         ddata->module_va = devm_ioremap(ddata->dev,
    1789                                         ddata->module_pa,
    1790                                         ddata->module_size);
    1791         if (!ddata->module_va)
    1792                 return -EIO;
    1793 
    1794         /* DISP_CONTROL */
    1795         val = sysc_read(ddata, dispc_offset + 0x40);
    1796         lcd_en = val & lcd_en_mask;
    1797         digit_en = val & digit_en_mask;
    1798         if (lcd_en)
    1799                 irq_mask |= BIT(0);                        /* FRAMEDONE */
    1800         if (digit_en) {
    1801                 if (framedonetv_irq)
    1802                         irq_mask |= BIT(24);                /* FRAMEDONETV */
    1803                 else
    1804                         irq_mask |= BIT(2) | BIT(3);        /* EVSYNC bits */
    1805         }
--> 1806         if (disable & (lcd_en | digit_en))

digit_en is BIT(1) so this mask doesn't make sense.  Probably logical
&& and || were intended or && and |?

    1807                 sysc_write(ddata, dispc_offset + 0x40,
    1808                            val & ~(lcd_en_mask | digit_en_mask));
    1809 
    1810         if (manager_count <= 2)
    1811                 return irq_mask;
    1812 
    1813         /* DISPC_CONTROL2 */
    1814         val = sysc_read(ddata, dispc_offset + 0x238);
    1815         lcd2_en = val & lcd_en_mask;
    1816         if (lcd2_en)
    1817                 irq_mask |= BIT(22);                        /* FRAMEDONE2 */
    1818         if (disable && lcd2_en)
    1819                 sysc_write(ddata, dispc_offset + 0x238,
    1820                            val & ~lcd_en_mask);
    1821 
    1822         if (manager_count <= 3)
    1823                 return irq_mask;
    1824 
    1825         /* DISPC_CONTROL3 */
    1826         val = sysc_read(ddata, dispc_offset + 0x848);
    1827         lcd3_en = val & lcd_en_mask;
    1828         if (lcd3_en)
    1829                 irq_mask |= BIT(30);                        /* FRAMEDONE3 */
    1830         if (disable && lcd3_en)
    1831                 sysc_write(ddata, dispc_offset + 0x848,
    1832                            val & ~lcd_en_mask);
    1833 
    1834         return irq_mask;
    1835 }

regards,
dan carpenter
