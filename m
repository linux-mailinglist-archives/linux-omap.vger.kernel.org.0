Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0107798378
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 20:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbfHUSpl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 14:45:41 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:45688 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728485AbfHUSpl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 14:45:41 -0400
Received: by mail-io1-f50.google.com with SMTP id t3so6597421ioj.12;
        Wed, 21 Aug 2019 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=duQPXWUKXzTpnq5PHDEhf2NqP5Llzhi/XFfpphsmqjU=;
        b=L6FY9vzaBHRCAZYmxoZof75tLMPCcbAO25iZ8TM7YHT7GQgCn5Oue/I4FMO1+AgGQw
         O4RVoUO/nfudouztdHAFP6z3QsMO8TChOTKTSjuCSNKtFBdvHGCA2sIjBgt3U6m43YWO
         G6HRXNpVkLegX/TRH/sYFob0bQcNiW4eD6dIjVVSpMYDEPhqc51QPj+q1uHAxRJ8isAx
         ml+rqCisSZbBHMQLYYMWmqF3VcKVNUgGC8h5QgOl3xhvi3rEMUNbjuHEGMYmspCFSjBr
         p9u4S406vCRGh7lkWHvpiitM/YZ4eeYp/cSim32cciTGAjYirgZqKfruvXpsQ+PTk3wA
         q95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=duQPXWUKXzTpnq5PHDEhf2NqP5Llzhi/XFfpphsmqjU=;
        b=VGQUlmDxopsf3eHpyf5fCt1m+tLW002nP9UsahvqJL5SrMhwkTrYI5eGXZcFKuBJ26
         gZG1VARBo2BwYKSy4s8KX0ytDKX0V7iP3j2Z+toPZ5aueWUQkeY35kp76K+FRYrtOEZd
         joIHJ525isZHW+lpICJUFIxTHA5e+FdgSThOmiuEo1LAOR2yk4PtR32zrXTDxidlmDLP
         uW0xbNiU0trogsBbkYb/si4MRhuq/YK8+3+YJOkm5Bh8k9H+3zBYcm6oRs3K9areKTpX
         ePuFEFgynlB/qZoH6V/iLb9gFH2duRIunq4Vv5EmME42fshhojdqf5xPWX/EkDT7NmTs
         O0rA==
X-Gm-Message-State: APjAAAUleop4vaPqJd52DdVo2j/HKVcqQydiolTyZmvPgATVPR63jUtJ
        LG3GAys3gGYn0sI5QTXmTjWGCCygQP9eO2dDmuM=
X-Google-Smtp-Source: APXvYqyGAGYNFuygKmKAmNDZnx4kR7duWeE9isnUp7UbCKAotJ0lnyYV0P6bcQyMgDhDh4obZ0RjoJXVkMYr4nCtX7E=
X-Received: by 2002:a5e:db0a:: with SMTP id q10mr33382306iop.58.1566413140158;
 Wed, 21 Aug 2019 11:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190818140838.GC30291@darkstar.musicnaut.iki.fi> <20190821183123.GC26759@pendragon.ideasonboard.com>
In-Reply-To: <20190821183123.GC26759@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 21 Aug 2019 13:45:28 -0500
Message-ID: <CAHCN7xLEiH6PttR6707dSVvi4N4qZM9UyXj4b-TUqOJSboi71g@mail.gmail.com>
Subject: Re: OMAP DRM regression on N900
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 21, 2019 at 1:37 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Aaro,
>
> On Sun, Aug 18, 2019 at 05:08:38PM +0300, Aaro Koskinen wrote:
> > Hi,
> >
> > I haven't got display working on N900 since v5.1. Bisected to:
> >
> > d17eb4537a7eb16da9eafbfd5717e12b45b77251 is the first bad commit
> > commit d17eb4537a7eb16da9eafbfd5717e12b45b77251
> > Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Date:   Wed Sep 12 19:41:31 2018 +0300
> >
> >     drm/omap: Factor out common init/cleanup code for output devices
>
> Sorry :-(
>
> I'll send a tentative fix, I'd appreciate if you could test it.

Can you point me to this patch?  I was in the process of
troubleshooting both a DM37, OMAP35 and AM35 board who all have blank
screens.  I'd like to try this patch too.

thank you,

adam

>
> > looks like with this commit I get only the TV out:
> >
> > $ ls -l /sys/class/drm/
> > total 0
> > lrwxrwxrwx    1 root     root             0 Aug 18 16:15 card0 -> ../../devices/platform/omapdrm.0/drm/card0
> > lrwxrwxrwx    1 root     root             0 Aug 18 16:15 card0-SVIDEO-1 -> ../../devices/platform/omapdrm.0/drm/card0/card0-SVIDEO-1
> > lrwxrwxrwx    1 root     root             0 Aug 18 16:15 renderD128 -> ../../devices/platform/omapdrm.0/drm/renderD128
> > -r--r--r--    1 root     root          4096 Aug 18 16:15 version
> >
> > with the previous commit both outputs are there:
> >
> > $ ls -l /sys/class/drm/
> > total 0
> > lrwxrwxrwx    1 root     root             0 Aug 18 16:28 card0 -> ../../devices/platform/omapdrm.0/drm/card0
> > lrwxrwxrwx    1 root     root             0 Aug 18 16:28 card0-LVDS-1 -> ../../devices/platform/omapdrm.0/drm/card0/card0-LVDS-1
> > lrwxrwxrwx    1 root     root             0 Aug 18 16:28 card0-SVIDEO-1 -> ../../devices/platform/omapdrm.0/drm/card0/card0-SVIDEO-1
> > lrwxrwxrwx    1 root     root             0 Aug 18 16:28 renderD128 -> ../../devices/platform/omapdrm.0/drm/renderD128
> > -r--r--r--    1 root     root          4096 Aug 18 16:28 version
> >
> > Used .config below.
>
> [snip]
>
> --
> Regards,
>
> Laurent Pinchart
