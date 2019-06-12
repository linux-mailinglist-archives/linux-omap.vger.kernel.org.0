Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1FD241E67
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 09:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731637AbfFLH4O (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 03:56:14 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41593 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbfFLH4M (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 03:56:12 -0400
Received: by mail-lj1-f193.google.com with SMTP id s21so14249375lji.8
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 00:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MpVyyIY+84Nucp0CGFI/TVYjVMVNEKw90ADvLXHqdCE=;
        b=ywhFsERMuu6cckroCnmO4n7s8QukIAuyz0zLikfSlsBUYZFkfXANfIGjA5/KhVSGhU
         wsTIS0bWPWJna21j3rW8yvYs+F3NDlNqUUNiwkURwt7WWjHQqvSdAVutVveDLoeATPmt
         YORL3OagMZLOBpPjV+Lzr3Zc5+emLQXq8fBsmzAk+ZzLkaAJi8UAoaKnj+VxyW7Gz8TH
         ZkfgwAA8LK1D47ev74wBPQDWl+uzPcltC2JGYtqEHXKChCSe2HGOK/amvFPZaQpfcYa8
         sP35dsdokzVNIdfr8KF3qAK8nz6YpxVF9GycG2qi5PIFNksCy8C4t63BybmL5wEh/Sng
         wPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MpVyyIY+84Nucp0CGFI/TVYjVMVNEKw90ADvLXHqdCE=;
        b=bOgMdOl0cJzglJAIhEbNiRwddbtN+N2NYoAfU6J/m77mp5/TA5AxpVnD3aPHvjk9++
         5/bKTfwB7nJb26WekpnVJRZ1Ao2joTKIxCZ6goKzyn83GcvnCMbtHm+AzSQsauftO0eM
         9QkkeJb0jsulxZ9XarJFV9iWyfGIBd5RckL1XMnYJ8hD0/41/3I1AbMgQQP4FrXfM1Dj
         ZNrXpzIwPmCQWaCD1rasyFMAfeqts0ufA0QVnx6YnZn2dbQ7kGy6Dd5h7JsqFNhSpFD9
         8blBKjI5rmg6I87S6O7gwiukyrQdnjQ734C5xCeoSLP7VLj71FrkTe3Tz3BMf/hA1NW0
         AHnw==
X-Gm-Message-State: APjAAAUcj3u3O9yXQEyrEmP0Qlp2MZtjLfhEcC6CXdt390PYNZVd8Kvz
        R1DjiARdXZkTU9voOFViyRNMtTOYvO0PGBlgUunSQA==
X-Google-Smtp-Source: APXvYqwBtvb1aHOu8BGk+6o3Llz+ZVHUG284rkHqlGevLtNgB6RjYMYSnQnZgYw64OXncNMQfXgGGBNNy6xlBvlYPQA=
X-Received: by 2002:a2e:7508:: with SMTP id q8mr26686053ljc.165.1560326170850;
 Wed, 12 Jun 2019 00:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-3-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-3-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 09:55:59 +0200
Message-ID: <CACRpkdZdCxvFQp9xssmqToeT5FrC4quusEgJOAbYo+TxUzGujw@mail.gmail.com>
Subject: Re: [PATCH-next 02/20] gpio: gpio-omap: fix lack of irqstatus_raw0
 for OMAP4
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 10, 2019 at 7:11 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> Commit 384ebe1c2849 ("gpio/omap: Add DT support to GPIO driver") added
> the register definition tables to the gpio-omap driver. Subsequently to
> that commit, commit 4e962e8998cc ("gpio/omap: remove cpu_is_omapxxxx()
> checks from *_runtime_resume()") added definitions for irqstatus_raw*
> registers to the legacy OMAP4 definitions, but missed the DT
> definitions.
>
> This causes an unintentional change of behaviour for the 1.101 errata
> workaround on OMAP4 platforms. Fix this oversight.
>
> Fixes: 4e962e8998cc ("gpio/omap: remove cpu_is_omapxxxx() checks from *_runtime_resume()")
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
