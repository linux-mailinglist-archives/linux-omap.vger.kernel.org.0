Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B61C41E6D
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 09:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436706AbfFLH5J (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 03:57:09 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:34562 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436703AbfFLH5J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 03:57:09 -0400
Received: by mail-lj1-f173.google.com with SMTP id p17so6957895ljg.1
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 00:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AXA5+gru4alxNYEnUDfWlNEf8IzRnyf79cJH1pZ+38A=;
        b=kyXw3a62hPc8udfYOuMAFQYc8Fccbdh+faAsJI+P80Pmxk1yzP+yGX3iYvLw6rKGmd
         Hq5U0d+axsu6EW2le0gAyQbKtW9kf/Ivndl6VImX75cPGL0Fcs+i59EUswbIX/VS2Xhe
         k76atnR56cJ9m+Gc7s2SUb6x7P9Xlwnk6yWRJ6MECQ6KIz0SlTN9IRrgopyv/Fh0563I
         S0qhrdQi0Ej8Uh/vBVyPDklESV3Z2hMmmSJoYCP9VMLofhElWe2ZL1d5PDyzXiWkUKIM
         83GyzWzjMVmFDkjFDTb9Ku1+kYkQvONmgcpVTlTkjGsljU7iz7h6TkDrpbNNxmcilk0v
         2zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AXA5+gru4alxNYEnUDfWlNEf8IzRnyf79cJH1pZ+38A=;
        b=XoBx1EZVm1wP1QY5sdOUEa0T3QxvnXlA3MRK1u2rn1/AgWULjdZ1zeYLnb6rDwW3wP
         iFpcIn1uXc7r9nzy97q9HP6tPfhBoSgWRzYfaTsVVUeVfjQYY7VwZ+NurNOS3MdpaWDX
         7vGK1qmogEatgCmwHQDpKkTU+0FghZCR+Z/oKvcNyPRFbFU7Fs/wVAvT0p2DF/0gO1aq
         e/yVa67pw4PipyQh627bn/rjRfs1c7H0brHDHuOprHWZgaWmM7PTmLqdkaMLCqSpCihB
         M5G7vX5N45dAvaPMr8LO3opShbU2pnQjYeGPToeyCmdzRMBEaMv8uPLbLUfwbvT3Kst1
         D4ww==
X-Gm-Message-State: APjAAAU3r5B1ipB4IM09Qk/Gplpiex4MuL5RIwbfJeuxK94MF9qy3zhy
        ba650wTVlLDg92GN3KaPOp6y3ficT5XSa6G/LRFzOOishe8=
X-Google-Smtp-Source: APXvYqyB3zRR+puZuMgastRuk2Y+CVJpnyH92tVnnNrgusklC+mEKSu4OgiVQhvUTB626b3d5lUUV2RAlvRSInwCGJ8=
X-Received: by 2002:a2e:5d54:: with SMTP id r81mr5507217ljb.104.1560326227130;
 Wed, 12 Jun 2019 00:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-4-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-4-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 09:56:55 +0200
Message-ID: <CACRpkdaH6mE8GoLGJfZFTQZntBdOLqJ3GxSGMX8xyi5nRzXhug@mail.gmail.com>
Subject: Re: [PATCH-next 03/20] gpio: gpio-omap: remove remainder of list management
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
> Commit c4791bc6e3a6 ("gpio: omap: drop omap_gpio_list") removed the
> list head and addition to the list head of each gpio bank, but failed
> to remove the list_del() call and the node inside struct gpio_bank.
> Remove these too.
>
> Fixes: c4791bc6e3a6 ("gpio: omap: drop omap_gpio_list")
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
