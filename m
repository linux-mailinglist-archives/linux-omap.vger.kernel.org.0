Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 574E16B6E73
	for <lists+linux-omap@lfdr.de>; Mon, 13 Mar 2023 05:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjCME3V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Mar 2023 00:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjCME3U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 Mar 2023 00:29:20 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C17B2A980
        for <linux-omap@vger.kernel.org>; Sun, 12 Mar 2023 21:29:17 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id y11so11602037plg.1
        for <linux-omap@vger.kernel.org>; Sun, 12 Mar 2023 21:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678681757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XZWJljCZTLJTay1u9WDo4/NCIqnGYgP7+4i4A4VqEcA=;
        b=oOv+tWaMVEWXItt8wgN8VM3EukEgAEBFId2q13Hm7Wxd2YooYqW34MvOV3P9lDX7HF
         QSI2VBN0ushhjIOVJOa/fPGueZ8iEYv/g5q2tmF/HjpdengJoUiQ6HLSIgwvOPvrFdgh
         avkyIiBTxGTu04XFINDazJk0HeElR7CkAynD+rnZD5nxZukWpaeXtmowPLp8XVl2tfbZ
         Y4xswJWHTPUslhxguVmHho9qks0ZujQcivtcmh8Y82wiBBnurI59JcM1cd+ibDgpL5RR
         GwI4haSghTexpcZHl2KFle7Y6osMSmcCCtk+mlCovyBAB/lVlXhEXiM/RUwz8Z6LWZUV
         +pDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678681757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZWJljCZTLJTay1u9WDo4/NCIqnGYgP7+4i4A4VqEcA=;
        b=GMNwd1S/rTGFlTejADcJ9NkVxyJY8DwrhDIPMQOzsTe4gd0vjS2ddVxGyMRpJ6Vw2c
         UQniq/LNsbZ97G3Kry+vHyBeU1IC0cwKdrEr5QFRcMzo8di3+BaTpznBv8DfR5zEpAGe
         CyIajMf418fbyAdL22jQXynlKX9IpkxJrsq+2YQMxD91T9EYz8Xx9wa6GOUhWN+U3hZG
         yt9aGjDpv7muXD+n0PhKtBEsxXNVARnPkn1j1LtYeCWrpoWnDt4r1qwPLX4EcMwAcZNH
         B5sgeUxdgXYAwN8PT9A2W2scOL7jHsDLgTmUlM/KLdHbyYAqDvSFUIuCIuvTa14POnV9
         L6Rg==
X-Gm-Message-State: AO0yUKWP/tyqnDQiKsKh6+fEaEaWaGxuBnLG2lZcRDPKOFkUmYKbyiHA
        L0K/xdpkJK4dUS2mP1o3oeGUig==
X-Google-Smtp-Source: AK7set908sTlB6jwJGCHrtkE9seweG/OTpEuZ6DuKlQGg8uGByBWB5Yi/DYCx+ImQpAFmhRFC5nMAA==
X-Received: by 2002:a05:6a20:4f0a:b0:d3:78ab:77c3 with SMTP id gi10-20020a056a204f0a00b000d378ab77c3mr6670980pzb.48.1678681757095;
        Sun, 12 Mar 2023 21:29:17 -0700 (PDT)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id z12-20020a630a4c000000b00478c48cf73csm3528441pgk.82.2023.03.12.21.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 21:29:16 -0700 (PDT)
Date:   Mon, 13 Mar 2023 09:59:14 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] thermal: Use of_property_present() for testing DT
 property presence
Message-ID: <20230313042914.jmbpmlfczad4epkv@vireshk-i7>
References: <20230310144726.1545543-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310144726.1545543-1-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10-03-23, 08:47, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/thermal/cpufreq_cooling.c                  | 2 +-
>  drivers/thermal/imx8mm_thermal.c                   | 2 +-
>  drivers/thermal/imx_thermal.c                      | 4 ++--
>  drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
