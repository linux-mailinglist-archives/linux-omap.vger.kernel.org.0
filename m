Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3C97B27BF
	for <lists+linux-omap@lfdr.de>; Thu, 28 Sep 2023 23:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbjI1Vyp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Sep 2023 17:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbjI1Vyo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Sep 2023 17:54:44 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F8519F
        for <linux-omap@vger.kernel.org>; Thu, 28 Sep 2023 14:54:41 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1dd830ed844so2399546fac.2
        for <linux-omap@vger.kernel.org>; Thu, 28 Sep 2023 14:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695938081; x=1696542881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naKczhcaLKU+Vpda4JS+O3EX4QsmtiJzh35tbmPshTc=;
        b=PCoYjmI3V2mhldvpUW+BMjkQqBzbnB1MUYixpHBD7jG/BGRFx0x7Ioyq+Quh4FwsC2
         vRNCmI/diDQ522VI74hzRphwWaXC+VKsTtO6dL8OhD1e1O9xjLnYADSewBOPWhpe5hXV
         PTOZ5MPinrpU3FHWZoVqDDYeGV0dCk6ogAIh6Wh3NzXx0weZpMohxZvsuX97U5YIYeOt
         M8j2fmiH11N6ABVKMx1IgsRXwuhCWI0BQvWQBjYCwmVNHOz4+OYMIj4bpfvwhkYvNFn+
         +i9OdRJTF2EtQW/g/7t5AXdUE2GrIEh1BOiaEv8h0EhEvNrZUAjEDAck9X1IQfGw3J4r
         X+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695938081; x=1696542881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=naKczhcaLKU+Vpda4JS+O3EX4QsmtiJzh35tbmPshTc=;
        b=iM0d9aYVPG8YUCUZSTUWe7HImyw/Ug8DMjToVznyPZ0zwrs8eUXrraktvPm+psLiCy
         x7wgl9b3KTPKXS0/Ia6l8wbYbAh62V/DZaUrSPwpz46Tq5gix9iaM4PzFhjHQ+DJrt+M
         Mq4O4EAoTvLmf9KmrtdHR9UJ5nuhgfgniI3NoS83YNTdoQpvzfoim5kvHHpmmfTOh0MU
         4m7SjLli2K52Q8Z+6dHCXnSCkkp3ntJfjshMIYaZT8Vi19FGz6yL2aKSprN5l3EMdAnC
         40QLunGw9d6ypUWp63L9Ib6LPeAkQU4k5PKcRKYNHfkUduh27Ed/eoKrFhNZ91U0MXPW
         AmKQ==
X-Gm-Message-State: AOJu0YwMSIofLLzHyWdxjsuGgyT7Q/CqJJnd25aMt/ZdS92IqqQslQJx
        gY1idAb4v1JwV8rvczNncCfDG9EhZNaFhnhCaJ+t2A==
X-Google-Smtp-Source: AGHT+IHOIrvsxrbfrHlW6R9fXJru9yxOJf/0wGCueRWD8DQMMhA/aXBY0UgxF6eu93B+pnrmI0ogQ+ibXsr5AvEap8U=
X-Received: by 2002:a05:6870:e0c9:b0:1d5:ab82:c3b8 with SMTP id
 a9-20020a056870e0c900b001d5ab82c3b8mr2689976oab.53.1695938081084; Thu, 28 Sep
 2023 14:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230928070706.2290137-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230928070706.2290137-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Sep 2023 23:54:30 +0200
Message-ID: <CACRpkdY+VgA773vbR_vAh7_YS47N1UBk_ae7ANZC5qim428Xpw@mail.gmail.com>
Subject: Re: [PATCH 00/23] gpio: Convert to platform remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mun Yew Tham <mun.yew.tham@intel.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-kernel@lists.infradead.org,
        Vladimir Zapolskiy <vz@mleia.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 28, 2023 at 9:07=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> this series converts all platform drivers below drivers/gpio to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.

The whole set looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
