Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0642C41F9D
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407047AbfFLItc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:49:32 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44196 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406732AbfFLItc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 04:49:32 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so14344288ljc.11
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 01:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Go55dDXBxVBTWBgHjRr7inycAYbApdoypRw2tPb4kWQ=;
        b=XULc8GkrnhaQZap8xerLTLJbDC4Vu3G3CYe+YRnGb9SOhgJo8QyYfbP/z4RLyLHyGO
         JI097H7HICDQV6/JiBVxzTFPbxvFr55c32ket0JRA1wepBTGOVMGHDkQkQpf+qPWOppC
         b6Ped6QGTDS2BkRxpdvw7W37G6Oe1I8/47flObJxn8Fv/sI+3J+Gq1x0SbMT+EU4kCL1
         m4UVOBVgo6/Abl2/aqX53jzwfKm1saWCRdhn8m88+wTfefqD5QyqRwgi/ZZsZELMBKYO
         w5Tkl1ULDEl4uCWNJ7yAGLlJK6bx7xmyGchKTAvL+v88bUvCxyYdhBcbDYsqsjpMRGwU
         QQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Go55dDXBxVBTWBgHjRr7inycAYbApdoypRw2tPb4kWQ=;
        b=k8eIkbw0nkGbHHiEnv4qmUTPn8+/kKPFCPtCP0RHD8Cj1RKO7B1KKO4S0f737/Yfl9
         Ml5UmGGctaoo7DkIWZnrCoTg+4ZX7rVjAwLs/EEeNn8yJHjiH20x3CLa+Kogk/O+8oni
         xXnt3aGFCwBmpWerU+3ix7UK8ZjJLDDIxSJeXqmYBCm+2UyVmJ72zO7ORj/XOjjgMhH7
         z9xwt8b136Hkg1xKCNaEkWGPRYTvYtfUhOfDDF3rxY/7GRMfSGLgYS5I+IFepOqFBign
         jqQxgfjJ64Kv6HEhm+i+q6KxrQ2NIfKAJX+zZXBnXHABm8linGKWHrWsSU7sBmA+nCKs
         Sf1Q==
X-Gm-Message-State: APjAAAUWUegUpE0jYna2hZQFgA7mBrkdrhUpDkLwh8S0jLb8ocKEiW39
        QOF/ztII+agPm9KCeMnQ9Av8s9fG1UzEc5nXenQpbw==
X-Google-Smtp-Source: APXvYqzT4UuSfXJUfCCGnwLeNcRt44Bq6L/QA4xe4AKQZSNz6rHdkZ/b4iGfLvjO/pGIhZkElV+yC5wfkayrlEYjqP0=
X-Received: by 2002:a2e:5dc4:: with SMTP id v65mr33005733lje.138.1560329370020;
 Wed, 12 Jun 2019 01:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-9-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-9-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:49:18 +0200
Message-ID: <CACRpkdY4eUN=E6BD-J=8oo+QjDPhL8giFasNrb-=vvGE7dTy1Q@mail.gmail.com>
Subject: Re: [PATCH-next 08/20] gpio: gpio-omap: simplify get() method
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
> omap_gpio_get() calls omap_get_gpio_datain() or omap_get_gpio_dataout()
> to read the GPIO state. These two functions are only called from this
> method, so they don't add much value.  Move their contents into
> omap_gpio_get() method and simplify.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
