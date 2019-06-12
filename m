Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B5341F78
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731727AbfFLInJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:43:09 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:41822 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbfFLInI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 04:43:08 -0400
Received: by mail-lj1-f179.google.com with SMTP id s21so14370125lji.8
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 01:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x+EjlD1+T7CCrikjK1HAO5M7exqwmkOmFUVOPSS1Jzc=;
        b=o2bm3iMtBobjXXtxNv1yFCOKCEhNUdN1OsTsR9YVk17KPGSUwu4aT0rnhkx69gbg95
         e2jjaVb1Se7IrsCu31pdFspgjFlEuVi9fGbKbg5PlhWAR+3A8iphpCXysUy9RzLYddgl
         aQNZlqA2yjNcOCK0yYlTihm0cVfIdW7csM0JGNjE93raaG/4HQLO9z5U0AY8tolh5QGv
         E9IiagQROkDPg0Gek2RaF8qaGdek3UkTHykivSnaKNP2wVIHhAaH/Qzd5o65P2RAW7MQ
         1LcaQk9sZ0sz5i9K0nXFhZxkqx8Xwd8rM86vTPKG20eZr4FXCJkN14MSO3s8wSzqj5B+
         GLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x+EjlD1+T7CCrikjK1HAO5M7exqwmkOmFUVOPSS1Jzc=;
        b=L/qQcntGzBCkuTJ1Gy1LLiHTKmS+xX/AUoeCsEd98kMXeCj3JWZY3iagA/+mqeMuz/
         4ZnEji2GBO4aSKHu+q2geMtkQtl80YE/nDWQkMnEawarohYNYMB5P3Zy3yPvYk0R+XfU
         ctjyzxFTj7LpsjruH7Y/d5PI1poS5FRkKNA5SW85grpxQIexW1YalULYAEaEMRxgdKYD
         kwL6Hidq0mBDD47T2hAq/2q7t5MB5JMUzMjPPaI0aF1+h42vv3MGuWTyZX32FT8lvy7V
         FfgMyGFI5ZWmcdcH0a5AH7+QpEOxOagh50HD62ulvCCK9Bh3BqhlsZmV3y89McWf8g4W
         T4Cg==
X-Gm-Message-State: APjAAAXMtwfCU/cWjstgVUGtZFpi0kHWvsNuZmoRT6TSwWAgoGcUpRmw
        JbkY0L2IGh1Kri3z/v19/2/B1+m6snUsq/EjqH924g==
X-Google-Smtp-Source: APXvYqxcESdgBagFUM3+T7x4f4AJ5XZlAtn+aqs2xl9XMwCPhMnxciJL8Ij4vBzLWAJ5RBgDBwAgRsx8strN2LlYm58=
X-Received: by 2002:a2e:7508:: with SMTP id q8mr26813533ljc.165.1560328986596;
 Wed, 12 Jun 2019 01:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-6-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-6-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:42:54 +0200
Message-ID: <CACRpkdbaXFZQ3d8pQJAxd2WaCJQbBHZZ4XKS3ovrq=ZOmP8o7w@mail.gmail.com>
Subject: Re: [PATCH-next 05/20] gpio: gpio-omap: remove irq_ack method
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
> The irq_ack method does not fit our hardware requirements. Edge
> interrupts must be cleared before we handle them, and level interrupts
> must be cleared after handling them.
>
> We handle the interrupt clearance in our interrupt handler for edge IRQs
> and in the unmask method for level IRQs.
>
> Replace the irq_ack method with the no-op method from the dummy irq
> chip.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
