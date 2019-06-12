Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECEC241F7C
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729596AbfFLIoD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:44:03 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44693 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729826AbfFLIoD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 04:44:03 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so14330729ljc.11
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 01:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NXPy6kD2gFwlUuId8WEznhJ1Poa05ZMGVOTjoPChSP8=;
        b=PvWCd5zJz+0mVVuAXjRL/ND/2lhYSSE9llh3OtEzsQ0B61njuSUX9TrFg106OnDYXv
         7MJTusmyWZAvT3tTcp6Y6hcTDZ30ekWrycGxhiG+s3YnCnBc6TXMenolVMwNjtThWRwn
         8QdZRgK1OLDdg0GEMsCK2G498LR8XVOSs20TuFYCiBb4fNzLZgh7AswQFGS5fQD6gkfb
         fFqAY+B0v+cIxSZt0wQMb9c422nvUSpo36CRYOvLf4Xy4l8fl8BOoZkLDnyzgoCWqwuZ
         8/VR0udQEUJdd/3r91eIImhpxBe68w83hYEQj6dOdA0kbG8WbihXERC5SUy/Vu9Ja7YD
         EQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NXPy6kD2gFwlUuId8WEznhJ1Poa05ZMGVOTjoPChSP8=;
        b=cbqyDDGZVKq9O95iQlmn3082V+UWJEqE5/a85cnQnx19Uw90hc2IxfRGZq4xP/Ju8M
         DIMaLIWbFLRQlYw9FPEpHD0xfiRJynbl5wuUTxhMDlSVHJ/Bbjb8ZnMAdUSNMFsUL1DH
         V45ZIr146kndDVyRDG/66AJlRTz6GwMM6hA5bwvasndzgJjBfYb/IrLuBhJQzLxlKKPn
         pfIGDm6LQgv5Gx0sUy1C8kOJu7OYgJiaCv3iwct5Qqnrsf04Hm7OGIEGaaEvlJ1ucI/T
         1mN88j5WmwJUXvXwViZmx8Sa9YjITTL3cEGA8selB0FvoUmvg7sUcAqSqvk+Dk6Fxroh
         iI/A==
X-Gm-Message-State: APjAAAUZXokB8QlfomLbpzZGiubMOQnB/EChvR7lYPw6NoB1LQjvwScv
        vMxdk1nHZzYGltIFnuBL3JedW6F0g2ChgihtCx8D0g==
X-Google-Smtp-Source: APXvYqwrPS8OsyBoY3vc54Mb2hWKOCvV7geC2RBav5pSRb1SLrflF9VirpQvaiOeoFCp8vBJ26VImCHonoZpxJ8bzlM=
X-Received: by 2002:a2e:2f12:: with SMTP id v18mr42060237ljv.196.1560329040984;
 Wed, 12 Jun 2019 01:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-7-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-7-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:43:49 +0200
Message-ID: <CACRpkdZy+j4bBV-0HPu4cdS3YppDxE6OAmqq9iTgcKOM1G9zSw@mail.gmail.com>
Subject: Re: [PATCH-next 06/20] gpio: gpio-omap: move omap_gpio_request() and omap_gpio_free()
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

On Mon, Jun 10, 2019 at 7:12 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> Move these two functions to live beside the rest of the gpio chip
> implementation, rather than in the middle of the irq chip
> implementation.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
