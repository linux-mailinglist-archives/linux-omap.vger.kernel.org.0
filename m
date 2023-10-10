Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CED0B7BFE36
	for <lists+linux-omap@lfdr.de>; Tue, 10 Oct 2023 15:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbjJJNoR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Oct 2023 09:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232710AbjJJNng (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Oct 2023 09:43:36 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8B2271F
        for <linux-omap@vger.kernel.org>; Tue, 10 Oct 2023 06:41:24 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a7c95b8d14so4738067b3.3
        for <linux-omap@vger.kernel.org>; Tue, 10 Oct 2023 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945283; x=1697550083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueK8SG+a7FTCY6O4EvQZ3DF32rOrkudVS05yOM+rm8Q=;
        b=pALrOtvUiukdglMyGsRr3uThX2dEh2snupInYNwlD2ewY0tTT6GLziyOUhO5/1Hrc6
         tgsfPxT0bLxpEDNMH9EshqkjJ9VweTRXAryRym748OFx8h0B3AL+QrCmw+7I0O7CQU2K
         isPz561MXCyShw1qOqdKMXZ1VkFz3j+lUFlbXJuKt8W6AAJYUAEMo/qjCkJv50/51AzR
         TentqMIUEmo+biSZQUUd3E/EZs8u/MO0Y1hgOMQ89+RbFbyIDhuVIugeCidfI2Eblq+i
         YPBICmDq0qqd8xzwU0vBnwxcNrguXMJuj/ruoGPhlDm0/5wC8xfZBkUL04F0nY1AdpuY
         VE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945283; x=1697550083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueK8SG+a7FTCY6O4EvQZ3DF32rOrkudVS05yOM+rm8Q=;
        b=YDbUgdTvh+1M8StiQBq/BNxF9rTEJn7bnT1xsFKovsgkaWrZDs6ZP2jQ61795fE0zS
         Humucp9u9YixbPaEn5RW8ma8yFrPzNUgdOautKP6pemz8I2pgCUiNl8VQh+jtmfdClWy
         SGy//a3MGep2VsSi0TOaAiN/MnWlaPgqmlIWtLDoVFA+5EedjJm0NM2/aG3SUsJt05+b
         Vlb1rO2T1Yw7lSR4IjWuQklJ5jqscRWGdLZ+zpAr7QJaC3M5e2RUSEcexnu2cuirmzxu
         Vh/N06Zl4jePiQtx2E1TR83rl6FElF7ixMj/gsSAkaNVaCYTXfgbuPxNXVlyfAjgljW0
         /h+A==
X-Gm-Message-State: AOJu0Yxtbm7e6CPSdGBz6udhr8CL+xIlyyJzKV4KyaoD/10Vr+74xxlZ
        tJS6oPMCgavpNmHNF+GlXk7GZLMYzWF1Ad9p9NTZ2w==
X-Google-Smtp-Source: AGHT+IFeF565XnMjdeGlwpA7Qpbln3q9KjwdSHBRpi1ETaQ6I7jQT4GcmMxVkkfUJJiXKQ/CDEsXHIM5K+82riuMrBo=
X-Received: by 2002:a81:a0d2:0:b0:59f:6cbf:8902 with SMTP id
 x201-20020a81a0d2000000b0059f6cbf8902mr18245533ywg.33.1696945283469; Tue, 10
 Oct 2023 06:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-13-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-13-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:41:12 +0200
Message-ID: <CACRpkdaK=gk7oeg6U7dcE7oJ0KhM5_FSpGo8Zv_87Fc-nRkyWQ@mail.gmail.com>
Subject: Re: [PATCH 12/20] pinctrl: single: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 9, 2023 at 11:23=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
