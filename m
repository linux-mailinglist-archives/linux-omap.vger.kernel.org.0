Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6567352E537
	for <lists+linux-omap@lfdr.de>; Fri, 20 May 2022 08:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbiETGpV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 May 2022 02:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345958AbiETGpU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 May 2022 02:45:20 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD4A14CA3E
        for <linux-omap@vger.kernel.org>; Thu, 19 May 2022 23:45:18 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id q130so8615190ljb.5
        for <linux-omap@vger.kernel.org>; Thu, 19 May 2022 23:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AnEwnvhKln/QqudtDrsLeq9rcJ9ha/C6wjXnDVo990k=;
        b=O6glMIfzZPcKFuiAIfpgKl4vPS6f/5kKRDEsCZ51jhpn2nvRMnbXG5g+EDHeE904nP
         t7HS+b/93itLD8AaEQHAOU/xrWjqGgTNAbPH9jakVpgMQTIhKd99kpg+p8rnNvdIqwdN
         6qoJ6hv6rNLvwFxEXHoFISEMQCRvxYIVNP2Tdx5gjSpfV8JASem8ZyxogIrKo+3noZeo
         On3nePrDC2RBv0fxVZnC2PEjR3MvP9xqKuaD0jO5YVuhsa36Q52R9it54/UTpAk0vFOu
         oN03MNBdr3Uh7nMtz9gRp/Uo5idHLu4wjadR99H/ArdkjYBw/HcmyNp38tQ7XXACXvAn
         7LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AnEwnvhKln/QqudtDrsLeq9rcJ9ha/C6wjXnDVo990k=;
        b=u3PzoR0EMZV0IQjU2MOWqYR8MMMQgRGVZ7J5yDQfhb6rP8deB+BbKSlJ5DsFghKfbP
         fV4IOTdlsySX46T9Z0OqFxc9Pv4UDRsTe1j/5R1GG26aOo5/9cdAEKFH4gLHj3170XdS
         IUipNAO/srD2wR0IlQcRY/QhnAlfyb2j5BnEYXtGkAPE+Kl1cCZTtYfq5hosdoQwBCCO
         E3NK8pSOPzmRS+VhCHQEOTzT9e27ThCoSINbrYpnTbssl8XYPAGPh6bvCZGz4Oq71F3s
         2haoC3zpJFweJYkkhYozlBFJzpMmsxGSUeizpfSFGvV07SBo1uzzJsmaGXeIUF588WDX
         jK/Q==
X-Gm-Message-State: AOAM533FBBMdMYr+3kLzcOmnNGY+jxitkbo3WYVIDHur5SFRmDOyNN1X
        1ZElmMdywWwjDQll6wbGu7J1Zg==
X-Google-Smtp-Source: ABdhPJxU0QeXD6emlDZWLebUbtElcVEEa6zD5/lvXQQQBtACmvvZZjPEOav+NOjy2nN8XnxEigbRJQ==
X-Received: by 2002:a05:651c:158b:b0:250:a056:7e48 with SMTP id h11-20020a05651c158b00b00250a0567e48mr4800506ljq.64.1653029116920;
        Thu, 19 May 2022 23:45:16 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y22-20020a2e95d6000000b0024f3d1dae8esm197255ljh.22.2022.05.19.23.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 23:45:16 -0700 (PDT)
Message-ID: <cab52964-31d5-a545-9856-b298d3cd3c84@linaro.org>
Date:   Fri, 20 May 2022 08:45:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 46/56] ASoC: samsung: Rename set_fmt_new back to set_fmt
Content-Language: en-US
To:     Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc:     lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
        nicolas.ferre@microchip.com, nsaenz@kernel.org,
        shawnguo@kernel.org, linux-imx@nxp.com, cezary.rojewski@intel.com,
        pierre-louis.bossart@linux.intel.com, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, daniel@zonque.org,
        srinivas.kandagatla@linaro.org, linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com,
        heiko@sntech.de, jbrunet@baylibre.com, kernel@pengutronix.de,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-47-ckeepax@opensource.cirrus.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519154318.2153729-47-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/05/2022 17:43, Charles Keepax wrote:
> Now the core has been migrated across to the new direct clock
> specification we can move the drivers back to the normal set_fmt
> callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
