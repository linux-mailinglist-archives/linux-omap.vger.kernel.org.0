Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163013B39B1
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jun 2021 01:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbhFXXVR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Jun 2021 19:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232741AbhFXXVQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Jun 2021 19:21:16 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8997C061574
        for <linux-omap@vger.kernel.org>; Thu, 24 Jun 2021 16:18:55 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id r5so13177065lfr.5
        for <linux-omap@vger.kernel.org>; Thu, 24 Jun 2021 16:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BVdHxGZqj8DMPWxofgWa1I04A+xffaUTJE88j4FN/wI=;
        b=XGO3Cc09FjQEhHh0lHOesLy9TqBpH2/g6YJUnMWTvs09c1TglgCcAgc+QKJG/laf+C
         83tQycrusn3X7g2GO+zqiaDhM6/XyU4m1k+XQQ4reEY7hotEcRkbVl7dKc9x2gMBnfdj
         NY3SuFe9EmM0/PS3un+IhY5QzR9Cs36jck65OMo9Mfn3wjpu8TayCex4TXCqUSgyGTu5
         hK+hPeY5KAFGc8qAYjoXEpbUxmYw9LvLTO+YJik7wa2oQUosQwzc+SGsIP33FQfqnMiV
         JJvG3vG11+C0CMAwtOkRgQ0XJ1O122HecuiVI1DbtdfWiE1SENFL+UO8bDUQEL9iuPVE
         /qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BVdHxGZqj8DMPWxofgWa1I04A+xffaUTJE88j4FN/wI=;
        b=tseHrXth6zYZt2UmeKk9DwxnY8h8JEHfaV6xcWjp0hUEvHqZdbtWJ/vdshJWJ0MDyi
         0hMcefZaGsys5rrtk7UVkVFbJKx+mB2CHASplHBas4Rh2TfPs9oJToznvwzBkAzN1aQL
         58U/eWC7SaFQsiF7/GfL+W8Oa6BbFdapy7J5tcanaX142ovuEg3l/gxW/D6h2cHQYZIZ
         TFhWTJoS8zXuUV5ZW5McDfcaYOKMdKq71RJw3StA3gNnL7CxHZGv+0zlk4RzCQ7vrtiZ
         jqGcCmaEl9I51SVC+THvgJevVT0LZb3grSZLbCKKtj0NAqCCLUmCqY1Iz+fy2+VXc2em
         34hA==
X-Gm-Message-State: AOAM533pbJhYXsZty9oQAaVr6++1Daua6ixbcCkFtnoX18BTYuxX0/J5
        5QKnpbd+zM/Y1msx7ruW3EiDR2GodZllN5HF7vVNjQ==
X-Google-Smtp-Source: ABdhPJwk8S3QEeOsps68MYw/zcn52DmnN71rZXFr+zwTJ02PcUgRfpmPpJoGy9M1V9S8AX/AyDnRuKhlI+5T4ITFgcQ=
X-Received: by 2002:a05:6512:3f08:: with SMTP id y8mr5509140lfa.649.1624576734131;
 Thu, 24 Jun 2021 16:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <8207a53c-4de9-d0e5-295a-c165e7237e36@lucaceresoli.net>
 <20210622110627.aqzxxtf2j3uxfeyl@pali> <20210622115604.GA25503@lpieralisi>
 <20210622121649.ouiaecdvwutgdyy5@pali> <18a104a9-2cb8-7535-a5b2-f5f049adff47@lucaceresoli.net>
 <4d4c0d4d-41b4-4756-5189-bffa15f88406@ti.com> <20210622205220.ypu22tuxhpdn2jwz@pali>
 <2873969e-ac56-a41f-0cc9-38e387542aa1@lucaceresoli.net> <20210622211901.ikulpy32d6qlr4yw@pali>
 <588741e4-b085-8ae2-3311-27037c040a57@lucaceresoli.net> <20210622222328.3lfgkrhsdy6izedv@pali>
In-Reply-To: <20210622222328.3lfgkrhsdy6izedv@pali>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 25 Jun 2021 01:18:43 +0200
Message-ID: <CACRpkdai2cvoNFR8yH2MHP+R27nQm1HZNK4-mJ50mE7DHrBmXw@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dra7xx: Fix reset behaviour
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-pci <linux-pci@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jun 23, 2021 at 12:23 AM Pali Roh=C3=A1r <pali@kernel.org> wrote:

> Lorenzo asked a good question how GPIO drives PERST#. And maybe it would
> be a good idea to unify all pci controller drivers to use same GPIO
> value for asserting PERST# pin. If it is possible. As we can see it is a
> big mess.
>
> Personally I would like to a see two helper functions like
>
>   void pcie_assert_perst(struct gpio_desc *gpio);
>   void pcie_deassert_perst(struct gpio_desc *gpio);
>
> which pci controller driver will use and we will not more handle active
> high / low state or polarity inversion and meditate if gpio set to zero
> means assert or de-assert.

GPIO descriptors (as are used in this driver) are supposed to hide
and encapsulate polarity inversion so:

gpiod_set_value(gpiod, 1) =3D=3D assert the line
gpiod_set_value(gpiod, 0) =3D=3D de-assert the line

Whether the line is asserted by physically driving the line low or
high should not be a concern, that is handled in the machine
description, we support OF, ACPI and even board files to
define this.

I would use gpiod_set_value() directly as above and maybe
add some comments explaining what is going on and that
the resulting polarity inversion is handled inside gpiolib.

Because of common misunderstandings we have pondered to just
search/replace the last argument of gpiod_set_value() from
an (int value) to a (bool asserted) to make things clear.
I just never get around to do that.

Yours,
Linus Walleij
