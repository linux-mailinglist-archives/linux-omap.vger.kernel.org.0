Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A43CA4202C
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731950AbfFLI6c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:58:32 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:42351 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731298AbfFLI6c (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 04:58:32 -0400
Received: by mail-lj1-f178.google.com with SMTP id t28so14361272lje.9
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 01:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PKauJBPQOqxGtVzNuf3fprEZzBxC6KXL4WG2Nxgkiks=;
        b=nnx+CuUK3eR2qMPr6GAKKvG0mkxPze1gLGjt+fq4RsDs4UUOoegAmM8XnLC3fnGQgW
         GTyqhslKNfo/iN3MHt0Zkvz4IqfR0N6rbMucbW0h2QpKLOE1944ZRLyzomjSZPncB4oB
         JdxHik6NRZooJbbcRYM8KsNh2VMSsKY6Br4iawfVt6D/w+eqx+VC7seuAfYo8l2rkyNY
         n6E0NgG//tOXiD7O6bo+tDyHU269Jh7/rKJm27EMXHQ4E4e4uoqiXyod6YS8/FQRssQq
         RxZZWrIoYGP/LrZaJcCtp3zHGIRLVAMIifqQZht5xZ4udl03rTMJAqgboklPlsWDanWr
         rwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PKauJBPQOqxGtVzNuf3fprEZzBxC6KXL4WG2Nxgkiks=;
        b=WL/Xv0/eKRmB7lEwF8equkS9FMSi72/LVJWXSiMYhHGRyRAOC1pMgzTQm0LVCbrX5F
         QoaQ7NxR5JAuNFKWL4C7cUsela75rE4xKCi9zfCerHqlbWNAcIX/Evz0h68Bv8x1QKun
         HnkE03T1YQEtQuyaWdRRZ8DkJ+/T9Ihj9vHrBEYoa83YLgotEwyvjebk000NVWKLTsdT
         6EAKPFuwkv5wxUFefUANBzrwUJEmZYfLk0TX2EcC5sCG/O3pMjkasomimSEyF/tfYkL2
         mDdCP4OfgBNkVTzXmojAYnb6Cmqqzm/GcmCjulxglxvIIBBedhN5opHwFfWEW/2BvcF6
         viug==
X-Gm-Message-State: APjAAAXB1+LeJRENCsSCpRHV8wIz9zV1Qf/UopXvGnlbAnDjFksr9krg
        s2DNiyOqjIRFG8MMfwIDViKld1J0PXIjvHnEp2QXzF/UOlg=
X-Google-Smtp-Source: APXvYqzAY9mtYPmypf1H3gmCAmSQiLenTibAeELDBFfuArXscCYTvhyZ71qp7kWngsG+U17kzAzSUBBfpqdbrkoZuoc=
X-Received: by 2002:a2e:2f12:: with SMTP id v18mr42095554ljv.196.1560329909819;
 Wed, 12 Jun 2019 01:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-19-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-19-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:58:18 +0200
Message-ID: <CACRpkdbELs-gZVeCCnFBaXOqzWQ74E+SF2ZCXOy4deGA+Bx9Tw@mail.gmail.com>
Subject: Re: [PATCH-next 18/20] gpio: gpio-omap: clean up wakeup handling
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

On Mon, Jun 10, 2019 at 7:13 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
