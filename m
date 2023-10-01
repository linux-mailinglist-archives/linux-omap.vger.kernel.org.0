Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5B607B4904
	for <lists+linux-omap@lfdr.de>; Sun,  1 Oct 2023 20:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235274AbjJASJA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 1 Oct 2023 14:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233932AbjJASI7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 1 Oct 2023 14:08:59 -0400
Received: from bitmer.com (server-237-49.tentacle.cloud [185.179.237.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE548E
        for <linux-omap@vger.kernel.org>; Sun,  1 Oct 2023 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitmer.com;
         s=key; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
        Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=yE49Vr6pptS+we01SoDcdrGH43G1IbFfqo3qFcIDImY=; b=M6E1/vc5QBUmN8Vju48mmV490O
        YU1iNjUX1GW9nKJGkJTU7a5Li4C1IBrWSeXkGQeGGw8jJnt1cI77LCMI5L7DxircuLlmthqOPjVqs
        T0yQhtf6pKW3kXIMs+z1E9Fg8iX26iVD225bT8nkQYiUl03+EY2Rw65EiRIz1/MsD1qZ1ilnY/ziG
        3N1iXny3H399pi59i3DAoFhK3E3LYiQ2bV4myWfmrJfrCX/v0ySxdNoqb5tincG1GfRaBKjnRQ0ij
        zQlXAKUwrZixsZe31mCQgJ/SJAFI0SQvufJ+fzsQcAG4qwMIs4ka62anYw8pKwbKq1Le9Ud8h8LfL
        Uw32wN5Q==;
Received: from 91-158-0-106.elisa-laajakaista.fi ([91.158.0.106] helo=[192.168.0.12])
        by bitmer.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1qn0Z6-0000Yz-TG; Sun, 01 Oct 2023 20:49:12 +0300
Message-ID: <4eb93a15-6e6b-4b81-aa3e-d78d7ef9476c@bitmer.com>
Date:   Sun, 1 Oct 2023 20:49:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] GPIO descriptors for TI ASoC codecs
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
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
In-Reply-To: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
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
> This cleans up and rewrites the GPIO usage in the TI
> ASoC components to use GPIO descriptors exclusively.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus Walleij (5):
>       ASoC: ti: Convert N810 ASoC to GPIO descriptors
>       ASoC: ti: Convert RX51 to use exclusively GPIO descriptors
>       ASoC: ti: Convert TWL4030 to use GPIO descriptors
>       ASoC: ti: Convert Pandora ASoC to GPIO descriptors
>       ASoC: ti: osk5912: Drop unused include
> 
>  arch/arm/mach-omap2/board-n8x0.c           | 10 +++++
>  arch/arm/mach-omap2/pdata-quirks.c         | 10 +++++
>  include/linux/platform_data/omap-twl4030.h |  3 --
>  sound/soc/ti/n810.c                        | 31 ++++++++-------
>  sound/soc/ti/omap-twl4030.c                | 20 ++++------
>  sound/soc/ti/omap3pandora.c                | 63 +++++++++++-------------------
>  sound/soc/ti/osk5912.c                     |  1 -
>  sound/soc/ti/rx51.c                        | 19 ++-------
>  8 files changed, 72 insertions(+), 85 deletions(-)

To whole set (for sound/soc/ti/):

Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>

And to 2/5:
Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
