Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C63214B3E
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jul 2020 11:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgGEJBP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jul 2020 05:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgGEJBO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 5 Jul 2020 05:01:14 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B719C08C5DF
        for <linux-omap@vger.kernel.org>; Sun,  5 Jul 2020 02:01:14 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l2so36969356wmf.0
        for <linux-omap@vger.kernel.org>; Sun, 05 Jul 2020 02:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=przTgcny48jd36+oUDZM5VqCUdMOADezAA8z959EYFc=;
        b=fF9zYQi0OpwzjVvrADGQzgm2O41ekp6ploUjNNPvEqx5jng5xwHlHbfYptRi64sPpg
         y9iYB7gdR12OKlD4m+vpzQ5HWVD/r2X/aXXkxecU8KXbkdyhQXG566LN+gYJJNhSfyS/
         0kCQ3Zc84FPQ3TKpJDQDW4mVezKPtKnTDxmNkz5FM55PWSYtAqq+DqYEmgLh2V4jfrz2
         JdqbhWl/ZYq2OW8Rw/xe0vw0KzeTxr7oWAN7tLvKB0oXTNY2y+LPpugCEZoIKz7Kqeug
         BLRT93sRc2OPX/gEwNf1uRSW/pD/rDyhI4EEsmUjNRqk1kJ/8FPgzO0k1kNaBgIWS6kd
         2VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=przTgcny48jd36+oUDZM5VqCUdMOADezAA8z959EYFc=;
        b=VTuXhgL8o545qM/2iR8azNNTjWCE74RT+Tv7fVN8+0NLYk9EkDhr3b1rtxWv88N3gw
         oMBBFp331C6W2a/KJLlgYv7Amy5Jbwch36IXPi7xburLLM+NbIIdJXEuCrq7kD/SWGiB
         NrfBZMwi1EMmgZck89AZQ7Kaw/u6OCSh0bAMPxYcbNJag7mBrwUEl1rkm4e0mEWgmDB5
         z3K2sJ6A0o5NhIdPo33qxuQ21zBK3iCJHUEyDkyBeaJ2bWHVGmng27fMZY88CrN/H3Dq
         9ikZXNHw4PcNSMEbKXaljYExQD0jNb5Wxeo13j009T9JhbNmGhrBmRzQsZxoiTWB5B1V
         jb7w==
X-Gm-Message-State: AOAM533sPel88sTFw2/T9EaCek8sDVgGN11DU/Gx/1Mp0mixJFcfAO9w
        2tQXhjzcG3hfO0Y+vJvc2ubr59dYspO/xmBNzuJxLg==
X-Google-Smtp-Source: ABdhPJynH7yvwhYRqBjAT6B2crW294fuviv7qzPIHYptEd/zWVZKZnYRZ8CfSV3sTGh2SAjw5YIHx6qxn3RjWJpV3bo=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr17960976wmg.116.1593939672936;
 Sun, 05 Jul 2020 02:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200701013320.130441-1-drew@beagleboard.org>
In-Reply-To: <20200701013320.130441-1-drew@beagleboard.org>
From:   Haojian Zhuang <haojian.zhuang@linaro.org>
Date:   Sun, 5 Jul 2020 17:01:02 +0800
Message-ID: <CAD6h2NQWQj1frtfVNorc_wt7CqsOZS7PLaPHZxABFhvEPxkKzw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: single: support #pinctrl-cells = 2
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 1 Jul 2020 at 09:33, Drew Fustini <drew@beagleboard.org> wrote:
>
> Currently, pinctrl-single only allows #pinctrl-cells = 1.
>
> This series will allow pinctrl-single to also support #pinctrl-cells = 2
>
> If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
> pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
> get the value to store in the register.
>
> To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
> omap.h is modified to keep pin conf and pin mux values separate.
>
> change log:
> - v4: squash patches 2 and 3 together so that git biesct will not result
>   in a boot failure
>
> - v3: change order of patches to make sure the pinctrl-single.c patch
>   does not break anything without the dts patches
>
> - v2: remove outer parentheses from AM33XX_PADCONF macro as it causes a
>   compile error in dtc.  I had added it per suggestion from checkpatch
>   about having parentheses around complex values.
>
> Drew Fustini (2):
>   pinctrl: single: parse #pinctrl-cells = 2
>   ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2
>
>  arch/arm/boot/dts/am33xx-l4.dtsi   |  2 +-
>  drivers/pinctrl/pinctrl-single.c   | 11 +++++++++--
>  include/dt-bindings/pinctrl/omap.h |  2 +-
>  3 files changed, 11 insertions(+), 4 deletions(-)
>
> --
> 2.25.1
>

Acked-by: Haojian Zhuang <haojian.zhuang@linaro.org>
