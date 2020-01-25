Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B007149342
	for <lists+linux-omap@lfdr.de>; Sat, 25 Jan 2020 05:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgAYEKj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jan 2020 23:10:39 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34616 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgAYEKj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jan 2020 23:10:39 -0500
Received: by mail-qt1-f196.google.com with SMTP id h12so3258444qtu.1;
        Fri, 24 Jan 2020 20:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EQnf/PSLd8HxryhRA93XP/hJ3+nOlFDpb2z4kyJm/Bo=;
        b=vK2YxIN1kHaMHhJo21y06yzQNwoStGIU0tl/cCu7Fplp/Ugkhc0fuLkgIBy5qLvC++
         4UKFZBDNGUJ6mv3qsoNlP0gvoF+JwlaLS+WNpcJgMDYDYdCdj6MB6/6uMRWym87jZu58
         cTxNXhkcwy8ZsIlJH5jwe1bdwUVieKBwYDAZQpl2A5oYRbYv0XLHk7rQkk2OHaLg8SuN
         kX+pyp9sc7aBpTmLx9bJcdtkZCq7OcqR7w7nXPX5kI38Rw+YjesLdhLYAoUiGzRatBPD
         lq2IqhYUAv5GNB2AWldQWB9daey4b/q2XFv5BWb6xTEVA+3WcI32xa3H+8AieBiXpw0L
         AEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EQnf/PSLd8HxryhRA93XP/hJ3+nOlFDpb2z4kyJm/Bo=;
        b=I2KjkiaeCfj9uH0uZk1Zlpl1czMMYRfV/2vj7GX+UePPATaHSO1I7nl7LuTJ4OjqMh
         7uSIP4k893OLMo7Eh7xo+1AoEconK/jgB3g+Ce8IfI7g+jDec3I0N9ijyA6+NWl7n6gJ
         rByILS1OAeMCNmqKT5I5UQP2vfZzXcjIg0MkxhnJoOMJbi1lTUpMmITMC6ZJRiyWrI6a
         rsfHE6x4KNmmYq/yhP+WDL4uNo9X8OPryG37nI8F34zv4Zep1F5sNpvh3x+vhK3tRkuE
         DL01FkDzzxyFkakxqrubGv/SuBPpqY4Uo3FqpHtN6yyjvtr6Cx/iGNSH2jgAd4D+auDz
         5DFA==
X-Gm-Message-State: APjAAAUtKPr34e/wvRjppZ8KsoK1QN0qAF3K7+OAVclVwos5VJ3IeTib
        rDg3gH1CYrisvM6o1OuAvVb74aVdlFUSYK62F4tS4g==
X-Google-Smtp-Source: APXvYqwVOwJljtXKhX/pjQWfN+aWKsqH6HECj0rPeWGLxT7lpdjgHebAcy0EHgU11OuPR6qoEnF8P1PHOYBUcQW81aM=
X-Received: by 2002:ac8:7b24:: with SMTP id l4mr5942604qtu.3.1579925437832;
 Fri, 24 Jan 2020 20:10:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578453062.git.baolin.wang7@gmail.com> <315adcc5dfc6aa5c001448401dda4065e33deef2.1578453062.git.baolin.wang7@gmail.com>
 <20200122001515.GA14744@builder>
In-Reply-To: <20200122001515.GA14744@builder>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Sat, 25 Jan 2020 12:10:26 +0800
Message-ID: <CADBw62okdejAcXcT23gUL4qLLFo5YhzisF8uSdoOOheoqv09-A@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/3] hwspinlock: omap: Use devm_hwspin_lock_register()
 to register hwlock controller
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben Cohen <ohad@wizery.com>, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Bjorn,

On Wed, Jan 22, 2020 at 8:15 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 07 Jan 19:14 PST 2020, Baolin Wang wrote:
>
> > Use devm_hwspin_lock_register() to register the hwlock controller instead of
> > unregistering the hwlock controller explicitly when removing the device.
> >
> > Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
> > ---
> >  drivers/hwspinlock/omap_hwspinlock.c |   13 ++-----------
> >  1 file changed, 2 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
> > index 3b05560..9e8a8c2 100644
> > --- a/drivers/hwspinlock/omap_hwspinlock.c
> > +++ b/drivers/hwspinlock/omap_hwspinlock.c
> > @@ -131,8 +131,8 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
> >       for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
> >               hwlock->priv = io_base + LOCK_BASE_OFFSET + sizeof(u32) * i;
> >
> > -     ret = hwspin_lock_register(bank, &pdev->dev, &omap_hwspinlock_ops,
> > -                                             base_id, num_locks);
> > +     ret = devm_hwspin_lock_register(&pdev->dev, bank, &omap_hwspinlock_ops,
> > +                                     base_id, num_locks);
> >       if (ret)
> >               goto runtime_err;
> >
> > @@ -148,15 +148,6 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
> >
> >  static int omap_hwspinlock_remove(struct platform_device *pdev)
> >  {
> > -     struct hwspinlock_device *bank = platform_get_drvdata(pdev);
> > -     int ret;
> > -
> > -     ret = hwspin_lock_unregister(bank);
> > -     if (ret) {
> > -             dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
> > -             return ret;
> > -     }
> > -
>
> Relying on devm_hwspin_lock_register() to hwspin_lock_unregister() will
> mean that pm_runtime_disable() will now be called before the spinlocks
> are unregistered.

Yes, you are right. Thanks for catching this issue.
