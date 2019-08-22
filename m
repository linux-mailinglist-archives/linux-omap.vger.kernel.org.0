Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2166B98984
	for <lists+linux-omap@lfdr.de>; Thu, 22 Aug 2019 04:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729284AbfHVCjl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 22:39:41 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:42648 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729253AbfHVCjl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 22:39:41 -0400
Received: by mail-io1-f46.google.com with SMTP id e20so8804085iob.9
        for <linux-omap@vger.kernel.org>; Wed, 21 Aug 2019 19:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DjkqXBEpoRl7YWU1PeR2dqOHuwVcGnBT/nBbzmjYkzo=;
        b=uyiL7ghi5f1jy1APYYvpzV5FMe9qOAsRl9pjy7QVpo986Ty7xTQa8pbfJtBPSiNe4P
         AVGi+3DAi7gD7567Y08HlWy0LcOO8t0NxFURuvXa6dSoXJIBmOrzELvR6w79KM9w9V6B
         6oGTs38ok5p5tpXndqbO5LTv34QvoIrSJo5l8Hdyy+zbedGge8ZOF1Vicpo/wvFSUlUb
         AVFE8vgDmtCGTYgziPytM9+/YP9vU/8s750w3Rdqvvnty8D8wi/HQG5ghrRIZQTYL/iz
         mU5Uc9c8DDpYbHLU0iqT1/aXV5cVmZg02CvIH1gHopVykFXj3wrsOngc9WnqwZveDTOt
         4xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DjkqXBEpoRl7YWU1PeR2dqOHuwVcGnBT/nBbzmjYkzo=;
        b=jhaXe0vl+/TNW6CrxGILv9CK3FJnadZtRo8jThNenxiC5JFXDqZvYm7zfgzdeH0IX4
         26WrErtgzCqPCwDrKhZgum21cxhlIH99O6NDKSFb1AbHzNs/jGUh8nt7b/qxb0W2dfKu
         oV+0aNSw5XOD7tPcy4YXSHyAz7LSVuVr3vy7xu9/jZJDyyhFpgiF1teLAoSuHgGDyAv1
         h5sPvmfHdsA+RGcqJakKhUOSSTiJV0pMbQd0KOWoy4/+SJa974lJCWxBTJUOy80Gpw1F
         +BoORUwQP0diOR+Y9XiisIEzY3I5JafJKCzu7n12cKIZjqx11A2GkbdbbSUuA2wWz7wa
         OyAA==
X-Gm-Message-State: APjAAAW+xWKzgdxByWJy/R1Nn6uiQjXdPxbxFkkmO9/rLmFUamsHtd2p
        eNts+74bk/wniPI0iln4/OjBpcQIpra8nQCnkqcKzGCRBV4=
X-Google-Smtp-Source: APXvYqyrLPYM1EnwxEvoQOXg8DQOk06/bHMKOZeDBrRRhOlp2KKgjF2e3o32y3NnqOWpi4MaPdOfzoa7unHI1VZoKJY=
X-Received: by 2002:a6b:c98c:: with SMTP id z134mr10104989iof.276.1566441579698;
 Wed, 21 Aug 2019 19:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7x+F9c-_0febeV1EdJqVBs8aOrqYLQdds26MT25t=Sa_Fg@mail.gmail.com>
 <20190822020850.GC17402@pendragon.ideasonboard.com>
In-Reply-To: <20190822020850.GC17402@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 21 Aug 2019 21:39:27 -0500
Message-ID: <CAHCN7xJdCBLo2Qop6gD1kRFXE-fxkH3OuN0XO6t9kUJ3HA-tRw@mail.gmail.com>
Subject: Re: Question about drm/omap: Remove panel-dpi driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 21, 2019 at 9:08 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Adam,
>
> On Wed, Aug 21, 2019 at 08:14:43PM -0500, Adam Ford wrote:
> > I know it's been nearly 9 months this this was removed, but for those
> > of us who still define our displays in the device tree expecting the
> > dpi-panel, we're not getting video.
> >
> > The commit message only states:
> >
> >     Panels are now supported through the drm_panel infrastructure, remove
> >     the omapdrm-specific driver.
> >
> > It does not give examples of how to do this, and I feel like we should
> > have been given some warning or indication.  Is there an example I can
> > follow for linking a dpi panel into the omap DSS?
>
> Sorry to have left you with non-working systems :-(

I have really only been following the omap-linux mailing list and only
really focus on the LTS kernels because my employer uses the LTS
kernels as the basis for the their linux distributions. If there is a
different mailing list I should follow, let me know.  I just wish it
would have been marked as deprecated or something before just being
killed.

>
> If the panel is supported by a mainline DRM panel driver the change
> should be transparent (provided of course that the driver is compiled in
> the kernel or as a module). Most panels are supported by the
> panel-simple driver (CONFIG_DRM_PANEL_SIMPLE), with a few dozen of other
> panels supported by dedicated drivers (in drivers/gpu/drm/panel/)
>
> Could you point me to the DT sources of one (or all) of the affected
> systems ?

Sure,
The same panel is used on these these two boards:
logicpd-som-lv-baseboard.dtsi
logicpd-torpedo-37xx-devkit-28.dts

A second panel is used on:
logicpd-torpedo-37xx-devkit.dts which has the LCD timings defined in
logicpd-torpedo-baseboard.dtsi
The am3517-evm also uses the same timings, but the gpio enables are different.

The da850-evm uses the same panel as the am3517-evm, but it's not
using the same video driver, and I haven't had a chance to see if that
driver still exists or not.

Thanks for your quick response.
:-)

Sorry if my e-mail came across angrily, it wasn't my intention.

adam

> --
> Regards,
>
> Laurent Pinchart
