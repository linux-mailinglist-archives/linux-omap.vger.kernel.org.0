Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3670429437
	for <lists+linux-omap@lfdr.de>; Fri, 24 May 2019 11:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389549AbfEXJIU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 May 2019 05:08:20 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43635 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389510AbfEXJIU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 May 2019 05:08:20 -0400
Received: by mail-oi1-f195.google.com with SMTP id t187so6495271oie.10
        for <linux-omap@vger.kernel.org>; Fri, 24 May 2019 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fB4Mx1+ciujWx737rFsuAYwMzrj1DN17Thp/F78Hnjc=;
        b=d+squ87/oI0uVVahDHP6UGzMXCXMhgPZZcDo3lVXzeXUKSHBkQhc7gqWzihqo9vOQy
         CdgX6zR6DifJEB+vf61aGhD4gh3pjN/pnahyKTvjQWfAdRzfOTpjHqbQQG/bkMktFaVp
         oWdn/FYmS4jPv8RbWG9Betj4zgRTJFRn2F9hb8Wbn0tjO5TauhiOmLa/pn7sCcvh8+Tq
         TctxiuJGuhmN+OnrJMgEv+EMTx6LdVEBzpYwedKNLMLLhNtznxp7PAlxH/NTLuN4Hwep
         sBLq4Ew6yYq1c0EyYNmvCukIEtsgg+E/rtyVPuSFE2csK8qrl20iJk7W3VyNwXv7P5ca
         hzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fB4Mx1+ciujWx737rFsuAYwMzrj1DN17Thp/F78Hnjc=;
        b=UYCVvEw1q/VNiPJx2QvM+pyXQ6y9h9HsZ+CBY7SHMN3IxTprpGBn5DVhHew6XkE19M
         Z7aWOUYdI9Tih/UhAvUpYtzh2YSUdGDxJlAL+H0luF93STA/B7QilF7nYmAtwPIjLmRw
         Wk2kBXmjbcNx8E9QVL86vMQNLO+pRQRa4nUfXCqPBmeIQDEZxo3+VbwjGfvm2F4q1WX6
         viNNC4HhN/xEAVfCSwegfOJ/2zeLgOvZBosUpvGws/eYN0jI6CTOEfxz2Ueybuw7whir
         Jo1GmVltLeBuWTU2527YXPSl+QpjD69M4zbdazvx4iBcndfPYu6/8Wi/U8Zp/6gam/A3
         AEBQ==
X-Gm-Message-State: APjAAAUQPwiQKB+bnc+xhvKhv4CYNH6SOvIK8OSG5K0OYslPN1DDO+Bj
        sgh/U8WQvwPec4u4oE8HBuJ7hVKmusHVwUuIk88jZA==
X-Google-Smtp-Source: APXvYqxHbexWzTRLmkrsg+gXqQ60yiLxWfsxk2OkwvXCv6kRjRelFNf+AkPIWYQAJhahxwNOdWMgxZbeYGVl2JUIWH8=
X-Received: by 2002:aca:5785:: with SMTP id l127mr5290268oib.48.1558688899862;
 Fri, 24 May 2019 02:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190520190533.GA28160@Red> <20190521232323.GD3621@darkstar.musicnaut.iki.fi>
 <20190522093341.GA32154@Red> <20190522181904.GE3621@darkstar.musicnaut.iki.fi>
 <8977e2bb-8d9e-f4fd-4c44-b4f67e0e7314@redhat.com> <c2972889-fe60-7614-fb6e-e57ddf780a54@redhat.com>
 <20190523183623.GB5234@darkstar.musicnaut.iki.fi>
In-Reply-To: <20190523183623.GB5234@darkstar.musicnaut.iki.fi>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 24 May 2019 10:08:09 +0100
Message-ID: <CAFEAcA8C0WN5FwaW2kfWiRm1T8wML_fWXDKqRXP-Lv_P7ysy8A@mail.gmail.com>
Subject: Re: [Qemu-devel] Running linux on qemu omap
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
        Thomas Huth <thuth@redhat.com>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 23 May 2019 at 19:36, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> Cheetah works with serial console. I tried with console on display,
> and it seems to boot up, and the frame buffer window gets correctly
> sized but for some reason it just stays blank.

As a general question, when you're doing these tests are you
using a kernel image that is known to work on real hardware?
One problem we have with some of these older QEMU platforms
is that it turns out that QEMU is only tested with the kernel,
and the kernel support for the platform is only tested with
QEMU, and so you get equal and opposite bugs in QEMU and the
kernel that cancel each other out and don't get noticed...

(On the QEMU side these platforms are all basically orphaned:
if somebody submits patches to fix bugs we'll review them,
but they're unlikely to get a great deal of attention otherwise.
They're also quite near the top of the "maybe we'll just
deprecate and then delete these" list, since we have not
historically had any working guest images to test against.
If there's a real userbase that wants them to continue to
exist that's a different matter, of course.)

thanks
- PMM
