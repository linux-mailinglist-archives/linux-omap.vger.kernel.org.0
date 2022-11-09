Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4B4B6230E4
	for <lists+linux-omap@lfdr.de>; Wed,  9 Nov 2022 18:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbiKIRA6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Nov 2022 12:00:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbiKIRAj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Nov 2022 12:00:39 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6430226AF6
        for <linux-omap@vger.kernel.org>; Wed,  9 Nov 2022 08:57:44 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so1737754wmb.0
        for <linux-omap@vger.kernel.org>; Wed, 09 Nov 2022 08:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oH8r7BlXWnx5tm3ihT+0JcIc8ZQDPQZA0FACqj2Wto0=;
        b=knNcRhB436hadz9tUWEYXn+qTpktaNMtjV5rprMvZpsxbWXxJXWp1xirbUtVuUhm+M
         E0Mop0/PmibEM4re1wXjWJS1r1mLQgplgnESYhENhW7UwNXPj3JxSBVl+ZrXq62mns7L
         mI72Dd9S/Z+5n43lwJ3dg2pdWmDkbRt8SeVQIU3ed/s6o0jqz6H9zUkpgELTbGWHwukN
         8lcWkP0ynBzYTZCZBA9yCcFL6vb40eTZ+z66OlBgSAkIOSAR+U5GeL2O0zvBCSobg719
         C5trx+AuKLyROKsHC8kpBpnFYISHtfrezamIyPwqM5B8csclDE2h1L6c2zcqn+UUYAvy
         r9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oH8r7BlXWnx5tm3ihT+0JcIc8ZQDPQZA0FACqj2Wto0=;
        b=zS2LHG5eXnQf+kamvCIaLCORa+UY9PybCTd35hcqL3PAMGKkJ5YIJoAz1u3WIawY24
         1Yi561oCKdid/b/2LXGg1WX2b+10HXbDMuTllVFD8fjnKSa+NgggTxlmB6rvT4JwR9R3
         qjC2Wz6BtsWEBgNgBFuVGm5sXkn7UapT3gsO5zj3C4JlxyX+o8y2IeND9Y/eKpBuPKNf
         F/6LmaWkth6+EmTZJDB5GPBXLHpMn1FKf59rUFEXp/DXt0cB1y5RJ+wIQsauDodz0w8p
         JdLXnkSlv1tA0qxUHwlPu9Gp4srJtOgouj42YBrdxJENsXvClwcMmwhhNNLYcG/6TmN6
         Jkfg==
X-Gm-Message-State: ACrzQf0trILKIMt4YZcBcNR4a4RnGBkYhpfl4dAzvEu9NQ0RzyVGX1S+
        PnGaHhlY1tWiG3Um15utOQOccVi08Ft8ivUwKNOvz8B/YcAspzV+
X-Google-Smtp-Source: AMsMyM5iqyYnCtmjz7jX6IqM4DToiZ5072U2FLU107JubGOU9FkNjNvwDBQ/74HNzbXD5XctpKBA4Or9ZCYtdSAZon8=
X-Received: by 2002:a05:600c:2116:b0:3cf:69ff:5da2 with SMTP id
 u22-20020a05600c211600b003cf69ff5da2mr38161535wml.16.1668013063005; Wed, 09
 Nov 2022 08:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20221109160904.183147-1-mpfj@newflow.co.uk> <20221109160904.183147-2-mpfj@newflow.co.uk>
 <3c530543-6d89-bf63-8734-7ccb02aede84@linaro.org>
In-Reply-To: <3c530543-6d89-bf63-8734-7ccb02aede84@linaro.org>
From:   Mark Jackson <mpfj@newflow.co.uk>
Date:   Wed, 9 Nov 2022 16:57:31 +0000
Message-ID: <CAAbcLfjKxZfn8JW6h_k2S42_OHEU366xVm3U=3FWdacGTq6wZA@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: dts: nanobone: Fix GPIO settings for RTS/CTS
 pins on UART3 & 4
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 9 Nov 2022 at 16:22, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 09/11/2022 17:09, Mark Jackson wrote:
> > The NanoBone platform uses GPIO pins for RTS/CTS control.
> > The DTS still uses the hardware RTS/CTS pins so this needs fixing.
> >
> > Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
> > ---
> >  arch/arm/boot/dts/am335x-nano.dts | 8 ++++----
>
> You still use a bit odd subject prefixes. What did the log tell you for
> am335x files?

Aha, now I understand ... I need to change "nanobone" in the title to
"am335x-nano" to match our dts file, correct ?

Regards
Mark J.
