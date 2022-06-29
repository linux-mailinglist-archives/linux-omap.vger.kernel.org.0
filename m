Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A983560B4E
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jun 2022 22:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiF2U7Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jun 2022 16:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiF2U7P (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Jun 2022 16:59:15 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E014B3E5D2
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 13:59:14 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so402684wmq.0
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 13:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=f/RrlWKl28cVEJBLpgVFRaPER2f/TZX/XOdzqsJeiNU=;
        b=iJJZRw2X6WM9FkoUsgRMcuvCVmsFCc6eM8XjKqSs8HbEkRtrZWKT4lCSl9iQXCDNzX
         INM50JM3gMCaC7moYCSgiDV32S+GJC4PYcXd81vScyG3rc0wjcI9b84N0i/uWB4qRWIn
         fbeMYUQvavGJuV2lhSE4pJ5VaCG0jlnZg7IBYUdDtgikSv6zUKXoikTFUXwy3dDYpKX5
         DEi9hR977ezG7Cvd5w3id+3aUv+7CaoMDzdQkvwqMcri9EJovZheNcHfg6wczgZEnynn
         fa0mU+Yx5AAf4PujEXYWCTaChug/p72pbWKMy2Xw8HxASacTWyGkGpFJlsxGHW7jw+Yd
         cwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=f/RrlWKl28cVEJBLpgVFRaPER2f/TZX/XOdzqsJeiNU=;
        b=RmxWkaaRJ3O4/QBpVn7S9u4r2euS4ihEvqeXKxpozcdSxySWLi56D/PpEQV47Js0QD
         QGxbLEeR0e2d4/Ry+1wNuZyRQElDCxXFBoGF4wQJIAXq3DxQHU7PbVgw1XgaMEUGJg5K
         ka+uB8Jv9yWXtZGlB1v8Vm89WVyD0cr09e17qCtc/DwgUp8FI2vtObHlFhyoGND5kmtC
         jhYwhPOHALwN8bz8xOfDvj6EBbICoH5C2WMBu0S/jlZSsHgesTDNlExloTUxzJr3bAOP
         ihXjlxgoTNv1NuPer06b+Vs5tonx3srxcCHBFgw05MuT8pBDj98a4tv1mZbR7i6cA2O1
         snCQ==
X-Gm-Message-State: AJIora9l29lLIxUMvf1co7FWW0rXycSMLxx48/Q9XHYkZ3o2dKHZ4nqo
        GUopC1JcTMl1ysXEBmhuAdQ=
X-Google-Smtp-Source: AGRyM1uR+UWqIBwLudnuoYxbKwP5YlSzW6MLeHf57AP/MKXEB0UTGDFKpE5RS+HwgorX5qK9J996+g==
X-Received: by 2002:a1c:7403:0:b0:3a0:4d65:b1a5 with SMTP id p3-20020a1c7403000000b003a04d65b1a5mr5808071wmc.197.1656536353342;
        Wed, 29 Jun 2022 13:59:13 -0700 (PDT)
Received: from giga-mm.localdomain ([195.245.18.14])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c12c600b0039c811077d3sm4183626wmd.22.2022.06.29.13.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 13:59:12 -0700 (PDT)
Message-ID: <0010bbe738eb6853f49f07a6eb6043e0e7f426a8.camel@gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Marek Vasut <marek.vasut@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Lennert Buytenhek <kernel@wantstofly.org>,
        Marc Zyngier <maz@kernel.org>,
        Mauri Sandberg <maukka@ext.kapsi.fi>
Date:   Wed, 29 Jun 2022 22:59:11 +0200
In-Reply-To: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Arnd!

On Wed, 2022-06-29 at 22:42 +0200, Arnd Bergmann wrote:
> ep93xx
>=20
> These are still used, and the platform includes the only remaining two
> board files that were added after linux-3.0. DT support is probably
> doable now that common-clk works. Need information about which boards
> are important.

I'm still maintaining/able to test CONFIG_MACH_EDB93XX (edb93xx.c).

--=20
Alexander Sverdlin.

