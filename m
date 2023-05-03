Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCDE6F587B
	for <lists+linux-omap@lfdr.de>; Wed,  3 May 2023 15:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjECNCE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 3 May 2023 09:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjECNCC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 3 May 2023 09:02:02 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9A03C01
        for <linux-omap@vger.kernel.org>; Wed,  3 May 2023 06:02:01 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-77d049b9040so3332013241.1
        for <linux-omap@vger.kernel.org>; Wed, 03 May 2023 06:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683118920; x=1685710920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BozmJEISZG8VpIGq5e9BO+B4B1xoIZSJv2J5QCTb/TI=;
        b=24AJgBaEUKWdPIVRtAmwXYlupiAkpBnk1pCGmt66qRI9OOSbslBESabgRzAGxKO3T9
         LcRLec9psAY+Bqkph7T1BQWDIIMG/dT1+Hx8gyqce8GxqnUppk7DvmvwzGgk1/zAz3Hi
         J501w3QE0J0fcTiyTlUL87rpHlbZZXP66VUrI+f+OyQqmCtOxuBzYz/x7EhwIAAwAewx
         XkPyyroqkewhSB2x9KaeM9rKLO8X09mIvhhjhZRBO99ehwh+gHOoiK/ryoNOhJ3zZNYS
         xTtEkcyqan40+qqHpJM8Fgsn+/jqpZnrNRzGFVBDofwUUyKojEE1IglZrqtLckgk3AVL
         oStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683118920; x=1685710920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BozmJEISZG8VpIGq5e9BO+B4B1xoIZSJv2J5QCTb/TI=;
        b=ArFiPVJuJLToKENTe+ZvDNwcRkJgQhIw6SO4ElmPFLNmg9NCIClLtxqd/NM6hQN8qr
         2Eo7fMfg3SmoWMR30LFa4Uq+uvo9RjdChJtPTZtBbK1mjWiFr8wXjF6De9gjjUUFLNz7
         Q8IS1swA97WbpZn3H2YuRU4B0Py8ipfTlBJZWS0K8Qk/ug+2fHfOt+ekCn7Q7kA0W3HN
         hRB8zj9bcDZJ7MOxG9TeXN7tpviPi9TZ17GoTwTDX9u0tFrbe0/QEFtx8kwWXX4x4nos
         Lq40VoPRwvWxAuQIPDh1ZWh/++OPZzZPYFdG/vpG0C5R6MyLv+Y5G6D83KFB1b3FGYO4
         uLfw==
X-Gm-Message-State: AC+VfDyrK1g6OwOi6XBfJd0Tw1ORGkwnsK5uhI/gS5Y0bJ9pg5ZEEJ3a
        HHXqJhEhYmb7n7abhw56UOXkF4RoAPqxfOJaJp9wbQ==
X-Google-Smtp-Source: ACHHUZ5LN+eYNk66xWzeUOrIQ44drhXJBGqRDqWgma5Pqn9ZPSaIvNOiJD2JNY1TU6z/w7ISvI3So0l4DdgBV/7QihQ=
X-Received: by 2002:a05:6102:ecb:b0:434:4737:9760 with SMTP id
 m11-20020a0561020ecb00b0043447379760mr608005vst.16.1683118917498; Wed, 03 May
 2023 06:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-omap2-pdata-quirks-v1-0-e015f3a3ea46@linaro.org> <20230430-omap2-pdata-quirks-v1-1-e015f3a3ea46@linaro.org>
In-Reply-To: <20230430-omap2-pdata-quirks-v1-1-e015f3a3ea46@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 3 May 2023 15:01:46 +0200
Message-ID: <CAMRc=MczGKVFo+iWe_Pnvi3-hCK0fhmmkjp-h92RHONEHFAP_g@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM/gpio: Push OMAP2 quirk down into TWL4030 driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Lee Jones <lee@kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, May 1, 2023 at 11:05=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> The TWL4030 GPIO driver has a custom platform data .set_up()
> callback to call back into the platform and do misc stuff such
> as hog and export a GPIO for WLAN PWR on a specific OMAP3 board.
>
> Avoid all the kludgery in the platform data and the boardfile
> and just put the quirks right into the driver. Make it
> conditional on OMAP3.
>
> I think the exported GPIO is used by some kind of userspace
> so ordinary DTS hogs will probably not work.
>

While I haven't tested it (nor can I) so don't take my word for it, it
looks to me as if regular DTS hogs *should* work. If anything, the way
this quirk is implemented in your patch moves the export past the chip
registration, while ordinary hogs would be applied when the chip is
first added.

Am I missing something?

Bart

[snip]
