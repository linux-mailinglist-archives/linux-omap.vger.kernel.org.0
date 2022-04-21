Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B684509FD4
	for <lists+linux-omap@lfdr.de>; Thu, 21 Apr 2022 14:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbiDUMne (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Apr 2022 08:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbiDUMnd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Apr 2022 08:43:33 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDCCA220CB
        for <linux-omap@vger.kernel.org>; Thu, 21 Apr 2022 05:40:43 -0700 (PDT)
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MtfRp-1o2k2m0Ltf-00v8Ka for <linux-omap@vger.kernel.org>; Thu, 21 Apr
 2022 14:35:39 +0200
Received: by mail-wm1-f43.google.com with SMTP id p189so3106257wmp.3
        for <linux-omap@vger.kernel.org>; Thu, 21 Apr 2022 05:35:39 -0700 (PDT)
X-Gm-Message-State: AOAM533J4mnjo1wtn7tvhMCvrg/RREmO3bFLcUmv+fsm8GfDAlF0cFSP
        b8FaK2es06u1C/4H7XxRYZvTAZSic87thMLixpo=
X-Google-Smtp-Source: ABdhPJyNF2euNOgMLkVa0dx5yacmTJRRySkkqP2RuczwMAMvOSzpbCElGtv/AMTcjGmOjglKJB29I01rrjD2SHNDudg=
X-Received: by 2002:a05:600c:25c5:b0:38f:f0b9:4c8c with SMTP id
 5-20020a05600c25c500b0038ff0b94c8cmr8754525wml.20.1650544538781; Thu, 21 Apr
 2022 05:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220413081656.27848-1-tony@atomide.com>
In-Reply-To: <20220413081656.27848-1-tony@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 21 Apr 2022 14:35:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1c4H1Bi9ExfgSHg6uUdQD77UChjD528MmFPpFjrvSqFQ@mail.gmail.com>
Message-ID: <CAK8P3a1c4H1Bi9ExfgSHg6uUdQD77UChjD528MmFPpFjrvSqFQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: omap1: Add Janusz as an additional maintainer
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Arnd Bergmann <arnd@arndb.de>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:M6m87tsI7azc2nG5ieF3dnxnH13AbFlNvCddRz+Z6RtCVUILueQ
 o1Fjz+LnU/Wo9OoFVzKfURCUctY3noaDezKRzITYwwMGxePq+atCVSq7xo4PHdpnfGRT3WP
 WPUnujBeyZfsECYwU9kC7SRxrdhM4OLOWrMHQJpWu9mYmzRhtwZcmkLaooIquQlAaoVE8JH
 5aX0D1ncQGxPSx5fFdPxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p04iig/D5Fo=:QksiS5Qr8auSRFlSRYDZS0
 +pUgasHaKsd8Zj1XrwPpC9ZAw1PL/PBz5I2nFyuP64xzA5WuOcsn+tFh09+HZVeNzO8Igrb8u
 rSPV1KABLlcvkNaXNcVszjULhHrVJw69ROiPBXbyzsGsnU4Bpk7eNKLgk/eOLm8Rk5mkNhmDC
 hdfyBUVOIqEmsx86Q7sPfKeOOZ0NKy/AGaHkXAcHjaG1IfNPuEG6VzKzLk4lajIrylETwW6XY
 zD8K1WoLDKJKiPMeHV8PH4p6RfozjNeJ7pvYKzRR7ODwh9juGBLZuBV9QiT4dqJ2c+bfpLSuz
 aAJw6fcYfXKLHKYSpNW/W2gFmQH5BrV6/S7/W/pXxcvdU00pR94y/XaUYWb2kcnR87RIwAa3k
 1lf7K0V7zlfEkATSmGXkDO0a1sjwA4rx9DTotN4RINl1XuAT7Deh37bsfnv5qoRXdj6xgoJ4p
 wUC619YJp9PV0KRBDOAPYxza9jT8Z2TLWsZTcqEZlpB9p0+pJs8Ga5INnknFuV97hVXUC2iLd
 r6sxFLhccXdfppmUVmk4s/Bn7LzQl5ER3dkCpjGEwOHamfCyFuEgPmGDknB6aUmw4oKLYEWON
 7crBbkweAhpWs+VCJqd5tOxuVHXYez/JUg6BKww3lAghkFp+FREEkP10G2Ul9a8g0hTYjjBJW
 ONjJ1XdfXgAZ6BhUjx1zihB3QpMexCjT2tirTQQeplrr5iSFTxfAqUnLjj5bBfqSOD2LPF1dV
 Yk4GD324ePgZss+GXlSaGxT4wg0FUW1F2qPH6iN/cmJWpUIeCDgPwCUrVGOMLwL1fqXGboqKH
 l/J98Smm5Sl4VWfB0CMuaQq/3Onp2z6L5r8mLQD9lhyTM4sa3w=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Apr 13, 2022 at 10:16 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Janusz has been active with improving and testing the omap1 SoC support
> and has been recently working on adding support for the common clock
> framework.
>
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Applied to the omap1-multiplatform branch now, thanks

       Arnd
