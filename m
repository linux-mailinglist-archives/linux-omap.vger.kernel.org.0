Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF04E6B3752
	for <lists+linux-omap@lfdr.de>; Fri, 10 Mar 2023 08:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjCJH3M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Mar 2023 02:29:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbjCJH3L (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Mar 2023 02:29:11 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39061ED681
        for <linux-omap@vger.kernel.org>; Thu,  9 Mar 2023 23:29:08 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso2746034wms.5
        for <linux-omap@vger.kernel.org>; Thu, 09 Mar 2023 23:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678433346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AwBOkR9lwcDkjadRLgF0R44wF9qXADVSTiSBWCFE2ko=;
        b=mypyJqnC/F6lSavmkFjuNxCKPeRm25olFcbDuBbOsNUdgP5ZV1s0p+0BbdmQia3Nco
         eWD82VasDd0oGCDEKHhbnfPVkrOrJpT3f1RdWpJTlQ9FFHc8JoHhmHwOWxMA0+fH6UtJ
         5RnzxgtdCPBWoloVZpMX2hboHtHa6/ZkgrUh+vWSktIBlGqc4ZrFmPcCxkKAUI7h9WkK
         FqjdmcRRCl+OyDdE05M4VOz4/XwOMi9xUQjLahywyfgovNrTASKp3ts1ZdL9YTrjMBVX
         MCobRRHYDuKI5CshilPmv2tUYuHFRqIH/mMLjgOpNFDI0z8nmNRYTmaceloOm3TFnnFC
         kRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678433346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwBOkR9lwcDkjadRLgF0R44wF9qXADVSTiSBWCFE2ko=;
        b=eG6+U8mmXG8ygnHZELbZ9UDkgYKbFp53MHjTKcJDUuRfpTQnPQMDMS9QYr4/x1cNf+
         h+/GR3frDXm7YSjzaF3l6Rlnxdl4YB6T2v5OwOq/7MWM80kIBaTIrVZZoHTl3aUozKjH
         jcK+jgqQogvqzWjByXuryQdfIgCOqdGSdbepBesp1bciGMFO4nVdP/qJxynkrMjzIYXn
         T4Jbo++EZJMQbRyRfldQYcte7gVyEjBSs0OprQvFWW13egwYaS8ruvvlAJ8Md61ynouh
         PW+E5SEAH8JF1ma8ejYz/d42BjYyFAAn9WsbQ8T33fDYf9wL6KHsSUcRhSpVJb9Fg7wm
         Zjqg==
X-Gm-Message-State: AO0yUKWrHYIz0dMu0kbz37S0TZoWMkdnyScsEyTAENcuI04zauZZ82wW
        QJRgnsj7VkfXbPHxa452/dMv2w==
X-Google-Smtp-Source: AK7set92+cRtbKy+3ERr2ns8dFh7B2dy3XcYI3Bks9AgxAOC76oxIeXSLX+VzvC44JGh3SZrPpNXNg==
X-Received: by 2002:a05:600c:3ba5:b0:3eb:4501:6c60 with SMTP id n37-20020a05600c3ba500b003eb45016c60mr1132916wms.5.1678433346655;
        Thu, 09 Mar 2023 23:29:06 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id o1-20020a056000010100b002c71b4d476asm1393871wrx.106.2023.03.09.23.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 23:29:05 -0800 (PST)
Message-ID: <ef92dcac-cadd-b85e-d6ea-512684266e81@linaro.org>
Date:   Fri, 10 Mar 2023 07:29:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: do not include pm_runtime.h if not used
Content-Language: en-US
To:     Claudiu Beznea <claudiu.beznea@microchip.com>, perex@perex.cz,
        tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
        james.schulman@cirrus.com, david.rhodes@cirrus.com,
        tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
        oder_chiou@realtek.com, shengjiu.wang@gmail.com,
        Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-imx@nxp.com, cezary.rojewski@intel.com,
        pierre-louis.bossart@linux.intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        matthias.bgg@gmail.com, bgoswami@quicinc.com, vkoul@kernel.org,
        daniel.baluta@nxp.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jarkko.nikula@bitmer.com
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        sound-open-firmware@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 07/03/2023 10:30, Claudiu Beznea wrote:
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index 41db6617e2ed..dc892fac4baa 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -12,7 +12,6 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
>   #include <dt-bindings/sound/sc7180-lpass.h>
>   #include <sound/pcm.h>
>   #include <sound/soc.h>
> diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
> index d43f480cbae3..ee4a4b553e74 100644
> --- a/sound/soc/qcom/lpass-sc7280.c
> +++ b/sound/soc/qcom/lpass-sc7280.c
> @@ -8,7 +8,6 @@
>   #include <linux/module.h>
>   #include <sound/pcm.h>
>   #include <sound/soc.h>
> -#include <linux/pm_runtime.h>
>   
>   #include <dt-bindings/sound/sc7180-lpass.h>

Has these been compile tested? the reason I ask is because both these 
drivers need SET_SYSTEM_SLEEP_PM_OPS macro from pm.h which was getting 
included from pm_runtime.h, now that is removed, am guessing it will 
cause a compile errors.

can you atleast replace this with pm.h instead of removing it totally?

--srini
