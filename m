Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A627B4902
	for <lists+linux-omap@lfdr.de>; Sun,  1 Oct 2023 20:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235271AbjJASI6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 1 Oct 2023 14:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233932AbjJASI6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 1 Oct 2023 14:08:58 -0400
X-Greylist: delayed 1224 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 01 Oct 2023 11:08:54 PDT
Received: from bitmer.com (server-237-49.tentacle.cloud [185.179.237.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD098E
        for <linux-omap@vger.kernel.org>; Sun,  1 Oct 2023 11:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitmer.com;
         s=key; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
        Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=OHJV4Sbao8KEygABucM61Za6AzpYax4JS41eeNRQYSs=; b=YTF5G9ObZ+7XoTL8MThpatt+pN
        pNsI0Soe8j7Yz+THsOmlhlCovsxh71VAIbOdc1JjLArOXvO6neSNUpdxHBZfwl4f56jzeP584UsEP
        vGArS0TbjG54Aw/hkGncx3VfGK0i4DGxnoU6XJNxr0mHSqjF3YnDk2HYcuIgmOFFq1vvgfQ3LN18e
        0e2QoyvEoD5++jXLomIElCsh7Eep7bPVJfbN8JqCR4x0Q3ByV8g3qYsrVSITs9Z8gctSGjr2Yicem
        R5pyUr1BXJDfjnCPGKL+AMA7WUEdYgAP8KWT2to6DTHPn6iuIuTV1TRJQ400m1RZmEQArQP8NQ3u+
        /+p2wJwQ==;
Received: from 91-158-0-106.elisa-laajakaista.fi ([91.158.0.106] helo=[192.168.0.12])
        by bitmer.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1qn0Y7-0000Yz-Ov; Sun, 01 Oct 2023 20:48:11 +0300
Message-ID: <d402fbdb-fba7-412b-ae1e-470ad253981e@bitmer.com>
Date:   Sun, 1 Oct 2023 20:48:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: ti: Convert RX51 to use exclusively GPIO
 descriptors
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        alsa-devel@alsa-project.org
References: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
 <20230926-descriptors-asoc-ti-v1-2-60cf4f8adbc5@linaro.org>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
In-Reply-To: <20230926-descriptors-asoc-ti-v1-2-60cf4f8adbc5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/26/23 16:25, Linus Walleij wrote:
> The RX51/Nokia n900 uses the legacy GPIO header to convert a GPIO
> back to the global GPIO numberspace and then the jack using it
> in the snd_soc_jack_add_gpios() call immediately looks up the
> corresponding descriptor again.
> 
> The snd_soc_jack_add_gpios() handles GPIOs passed with devices
> just fine: pass in the device instead, and rename the GPIO
> to match the property in the device tree, and it should work
> all the same but without all the trouble.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
