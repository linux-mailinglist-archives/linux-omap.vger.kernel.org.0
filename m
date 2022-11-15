Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C1662AE30
	for <lists+linux-omap@lfdr.de>; Tue, 15 Nov 2022 23:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbiKOWXp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Nov 2022 17:23:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbiKOWXk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Nov 2022 17:23:40 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9A2263F
        for <linux-omap@vger.kernel.org>; Tue, 15 Nov 2022 14:23:30 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso391692pjg.5
        for <linux-omap@vger.kernel.org>; Tue, 15 Nov 2022 14:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjzOJ4JWjI/rFiIfW7JD3xxm7vDu7Fz660K9Mjj4qKg=;
        b=4k7qPs7pbm9QBjf0tYCMVG342rR32sEJMtdlPMPvebP99eRldAlqt2Ld/SmRSAlKpJ
         CnH060cgdHzlqO08NGDtiQ3A9LPXS4pIuvo63u40pJRwiuEnzDl4TL0Wul4Ze8ri32yT
         vLm6JXI7N9YvbgxQ1vZqHVWs9NQnI7ixEZgd4ICKLuwF4MRUBx95/lfnoBpukUKJSq34
         wIrFzwDChur5NQ9djuRYYRAwvqUdDa6J0VAujPlh0C2glEAxXRZtEUAFXIaqIi54HGcM
         hQC5WNSuzBBoGnHKOIjReMZWX0cdnsS4tdUNuF31YUXL2K//iyb+NBj+TTRPukJcRWsR
         aamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjzOJ4JWjI/rFiIfW7JD3xxm7vDu7Fz660K9Mjj4qKg=;
        b=hcW3WOD2JkeWsvkqRxTr83dwhW9E58uhLPQpgz/qC9JI6KntlEX78YMrx3mvodXWwA
         WQbDIhul3N9wcpzotCry2g0Xozd9DtJrQOUG5aQgD9tju0aktBecUNauF0SNu9FvEaYG
         NpEYcsU9eCt54cwiw8QZ4tHX6xKSBPRBMY2EAK+6nGFNKfxdT70xwVanx5N5f7WgJbO+
         BYLO1cu0hjMK36V1KRjh5g2sD7uogH/saTMWSJuviZyAyuRNnymQRXc1KBPur/3aySCR
         oXwTgQZBaTrTY1Pf+09JGE1i9GTYxry0Anh90rYegBFRqJFOtP38WtaJ5L5kjbzyKhyn
         4Kjw==
X-Gm-Message-State: ANoB5pkh7O900D0mCCVaV4fRiZrDfQHAzkUBRruVdtTUl+GPTT4bUPXn
        GKkc+Y4alC4vscQdid/V/Bb83A==
X-Google-Smtp-Source: AA0mqf4KRpELAta9shXItZn8iKm4V5CxDzckw/6NcM+enqkoUNZKdN2G5gML4yZAoBu4UTDj/47Efw==
X-Received: by 2002:a17:90a:b017:b0:212:cd99:915c with SMTP id x23-20020a17090ab01700b00212cd99915cmr533086pjq.38.1668551009672;
        Tue, 15 Nov 2022 14:23:29 -0800 (PST)
Received: from localhost ([75.172.139.56])
        by smtp.gmail.com with ESMTPSA id n4-20020a63a504000000b0044ed37dbca8sm8285655pgf.2.2022.11.15.14.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 14:23:28 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Neanne <jneanne@baylibre.com>, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, nm@ti.com,
        kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        shawnguo@kernel.org, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, marcel.ziswiler@toradex.com,
        vkoul@kernel.org, biju.das.jz@bp.renesas.com, arnd@arndb.de,
        jeff@labundy.com
Cc:     afd@ti.com, narmstrong@baylibre.com, msp@baylibre.com,
        j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v7 6/6] arm64: defconfig: Add tps65219 as modules
In-Reply-To: <20221104152311.1098603-7-jneanne@baylibre.com>
References: <20221104152311.1098603-1-jneanne@baylibre.com>
 <20221104152311.1098603-7-jneanne@baylibre.com>
Date:   Tue, 15 Nov 2022 14:23:28 -0800
Message-ID: <7h5yffamcf.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Jerome Neanne <jneanne@baylibre.com> writes:

> Development boards from TI: SK-AM64 PROC1004 include the TPS65219 PMIC.
> Add support for the TPS65219 PMIC by enabling MFD, regulator and
> power-button drivers.  All drivers enabled as modules.
>
> Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
