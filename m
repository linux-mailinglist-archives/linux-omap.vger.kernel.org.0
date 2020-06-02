Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B762F1EB76D
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jun 2020 10:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgFBIcH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Jun 2020 04:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgFBIcH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Jun 2020 04:32:07 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697E0C061A0E;
        Tue,  2 Jun 2020 01:32:06 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a127so2702352pfa.12;
        Tue, 02 Jun 2020 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ZQUYgk2V7Mx0esfmh4y3mmfTGvC64s4iQn4Jh1H8G8=;
        b=HmJGGygz1wL1O+w/dN5pG3C+kjX4bhh2rAcYhLaL4nrdg+aRCGL86aqPCKmDODTk0H
         W6GnOC+vBXUbBT87WvAYn5flUU2VGCZxuEo+O9hDshlGMB7wKHIDIzNYs2k86cF4hwQO
         Ki604kWSEjZcN1tfqdfjvbDUQmjMU+Rhv+DPPXRMRVS2T3zyLFjdS0sDOEW8PuZFoxOd
         goc6foUxMpEkGQJkAyrofUhpaOE12U3LtRnCkhrdnRRcgd5ziD55wlen4lbG5sY70LYj
         BNhjF1FIib1UbINzuK+MskR4KXmDzAtZOiMPUNA3Xu2v+17EiQRGofGcjTanOm2i6wc3
         yuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ZQUYgk2V7Mx0esfmh4y3mmfTGvC64s4iQn4Jh1H8G8=;
        b=IFDhJ9vwuFqUD1uh9Eb8ZxKiTo8dkfDdKMzfChf9t88y4YpP1s0HEwLPf+9rFRP/KW
         K4OSc8BpSJfyzi/2aiEvsuEGNfyb/AqaDXPwJEZbTnKKsguJcWniNoWRY3F925Z1v4ew
         a8tE5NI20Qk2zrANasuGbh5vXCljj9Pr41AkcNohWT9neNp0HCr6yW6hwL0moXTSP7zn
         4xS7UcllhuIdLsnZqjPWhc+Liz1pO5g9HZNdWXAIxoKfTh7cTMTF11NuWB09yNeKsvbn
         tF9WBBWKsg9NBaJpqGCXKhH7HavL+wESAZ6HBPqQwdwPe8ZpmK8EYjZwKjipC3yYkGAL
         1bgQ==
X-Gm-Message-State: AOAM532NdfEY4z9D4VI89oZ+mgK7MoLSdPndDCOYSpcp6DKuLLIRJVFD
        eNatIRpRwWfpqFZpOnzWiTOUSSTnBfNPG9EZnPs=
X-Google-Smtp-Source: ABdhPJwjAR6qWM3iADSoQUZxsvaZmkMb4RSf3zmVgzLNjjgc1H9ASyudk4ftkU45x4hKebGHa3tp9SwQoXYg0p/F9V8=
X-Received: by 2002:a63:545a:: with SMTP id e26mr22582548pgm.4.1591086725894;
 Tue, 02 Jun 2020 01:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200602001813.30459-1-tony@atomide.com> <20200602080811.GI19480@localhost>
In-Reply-To: <20200602080811.GI19480@localhost>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Jun 2020 11:31:54 +0300
Message-ID: <CAHp75Vfi5nDgwT10J_EKYn90vGuiL1hyfre+t_w_OFREFY-Tqg@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_port: Fix imprecise external abort for mctrl
 if inactive
To:     Johan Hovold <johan@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Peter Hurley <peter@hurleysoftware.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 2, 2020 at 11:09 AM Johan Hovold <johan@kernel.org> wrote:
> On Mon, Jun 01, 2020 at 05:18:13PM -0700, Tony Lindgren wrote:

...

> There's shouldn't be anything fundamental preventing you from adding the
> missing resume calls to the mctrl paths even if it may require reworking
> (and fixing) the whole RPM implementation (which would be a good thing
> of course).

Yes, for serial core I have long standing patch series to implement
RPM (more or less?) properly.

However, OMAP is a beast which prevents us to go due to a big hack
called pm_runtime_irq_safe().
Tony is aware of this and I think the above is somehow related to removal of it.

But I completely agree that the goal is to get better runtime PM
implementation over all.

-- 
With Best Regards,
Andy Shevchenko
