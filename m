Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2FC1715D55
	for <lists+linux-omap@lfdr.de>; Tue, 30 May 2023 13:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbjE3LhK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 May 2023 07:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjE3LhJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 May 2023 07:37:09 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C229CFE
        for <linux-omap@vger.kernel.org>; Tue, 30 May 2023 04:37:06 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5664b14966bso30211587b3.1
        for <linux-omap@vger.kernel.org>; Tue, 30 May 2023 04:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685446626; x=1688038626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fipiLZLGfX4/1UxxNAJShfinAkElOTmQ9bvtKEuEuxw=;
        b=uOh+52nn4q+fLREJIUy7KO06MoLfqAQkv8mOsVNFntA6TzWyQ06Y2BThSyMq3wWhLq
         zKHYrBOLNFciPFL+72Uz9eRSV5XrJLjOAksd1RdT5og8gKjik+lQ1KfTUgLYLE60IEmd
         9zp1/8Fm1rhA6YA0IX+CtRsstIZSQZ/cqs3pJJGExe8gdxKRbaPwo6tuayptQlRdrqBD
         2ZuCw5ZBp4s7fk5ezVtWmyPbe0g2YIQ7jtqxmoH6hZAsHnmK7xYsms6H/1QmRoS9jpVV
         eV/4miN84WNTnl52fa2MISMlbcZfhKyJRkdJM3UV4mSfIVXpPmkV/rNFje09RhGigWJ7
         8+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446626; x=1688038626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fipiLZLGfX4/1UxxNAJShfinAkElOTmQ9bvtKEuEuxw=;
        b=C6y5QbHRRPYFbbgYKkmtaKPdJRS67cC8zWgyqd3NqxxRDKOHAemqk3Rzugovm550LY
         oguBQxqVo3MkoOuDnb+4oodOmn9dFP8+bYhFjX+tX0YN2OwAArUK3ODVIKQm8S3VQlLG
         KdI7B7dW8Xv5dTsH4fbWSJH0i77HK7MjRwqe7QosbV3DcUna/uMfLqYA5D/rKisdZJ0K
         AZtn/ohMddMGOeZywm8NG3XU/16vPCvB48T65HBz/YM1mE5457uufSuAv1TE1yE5otYx
         nQBzhJ20EIS/vRqfsF+J28Gz0eMPAZizOFyJU/Bpwp2JuCL8eefaUOQvmcOn6Ns5Cw9t
         0W+w==
X-Gm-Message-State: AC+VfDxhy88BUitbpR/89V+kiqOuvRW8+OR15MSFXX3grz4S1Emxrz1g
        dyI+UIfFlwdnooRmrMZ1MXxfIVsNKcLSUwk75dmpPQ==
X-Google-Smtp-Source: ACHHUZ7RV9zV0oEPR8Q7c7k6kqfUUzMEoSzKHD+O0Fj48PMvU5x4Uul6Uh+8k+/1HYAala5Qo0yQtHV5yNCcrwYwjo8=
X-Received: by 2002:a0d:ed04:0:b0:560:befc:6682 with SMTP id
 w4-20020a0ded04000000b00560befc6682mr2020042ywe.42.1685446626022; Tue, 30 May
 2023 04:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230511-tps65219-add-gpio-support-v4-0-b5d6a764d722@baylibre.com>
 <20230511-tps65219-add-gpio-support-v4-1-b5d6a764d722@baylibre.com>
In-Reply-To: <20230511-tps65219-add-gpio-support-v4-1-b5d6a764d722@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 May 2023 13:36:55 +0200
Message-ID: <CACRpkdZfWF5Bq5id_JyDe2GLc7OojiD7R6g2ZiHswPD3D_UT_w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: tps65219: add GPIO support for TPS65219 PMIC
To:     Jerome Neanne <jneanne@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
        khilman@baylibre.com, msp@baylibre.com, francesco@dolcini.it,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Jonathan Cormier <jcormier@criticallink.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 30, 2023 at 10:00=E2=80=AFAM Jerome Neanne <jneanne@baylibre.co=
m> wrote:

> Add support for TPS65219 PMICs GPIO interface.
>
> 3 GPIO pins:
> - GPIO0 only is IO but input mode reserved for MULTI_DEVICE_ENABLE usage
> - GPIO1 and GPIO2 are Output only and referred as GPO1 and GPO2 in spec
>
> GPIO0 is statically configured as input or output prior to Linux boot.
> it is used for MULTI_DEVICE_ENABLE function.
> This setting is statically configured by NVM.
> GPIO0 can't be used as a generic GPIO (specification Table 8-34).
> It's either a GPO when MULTI_DEVICE_EN=3D0 or a GPI when MULTI_DEVICE_EN=
=3D1.
>
> Datasheet describes specific usage for non standard GPIO.
> Link: https://www.ti.com/lit/ds/symlink/tps65219.pdf
>
> Co-developed-by: Jonathan Cormier <jcormier@criticallink.com>
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> Signed-off-by: Jerome Neanne <jneanne@baylibre.com>

I agree with Andy's review comments, so fix these.
Once those are fixed you can add my:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
