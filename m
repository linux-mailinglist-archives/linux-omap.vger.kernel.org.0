Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4DE017AB9C
	for <lists+linux-omap@lfdr.de>; Thu,  5 Mar 2020 18:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgCERPN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Mar 2020 12:15:13 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:45947 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727985AbgCERPM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Mar 2020 12:15:12 -0500
Received: by mail-io1-f67.google.com with SMTP id w9so7267157iob.12
        for <linux-omap@vger.kernel.org>; Thu, 05 Mar 2020 09:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bLVc72+NvHbHflO1/mhElGn5mslbixEGyqtU22wNbzY=;
        b=BQufJX3zg+gQzLw25jvC+wiv8qKJlzqGMQwSX/omduYNht7JYBotYPuk8BMzUHJsai
         +bof1wzwev80VmQzxXBx80uOrRkIYRbZgwiAYDG2h9x5ap/t/00Rrq47r9AyxQLIdlOu
         UUvRD+R8Pe1l5xhuaw7JfIQ94SuWG0lTvOP4gEj3TDbLdK+gG7s3SrVsqVHn2hvmh4rg
         HSq4JSqtAa9ULRPAFOl0qS24pqOVRuxNB0f9Qts5KqCeYKCNq9hI06D1pCWrzkuoZoRQ
         7MEIU4+Qr1U7zR5cAINsOrJTi/f+MFURPhxPwOOwjJNvgNtfuNy1nKSCP/Y78bheVS01
         ZniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bLVc72+NvHbHflO1/mhElGn5mslbixEGyqtU22wNbzY=;
        b=E1x8HWe+HV2E/tEqgRvR6ddtSF9FXHQoVtqAMpScnBJMOJwOxdxT5r6QYvZxrSmgbn
         6GVJ/244VIZms8ykboabzE6TEjyTZyhg6nLSLcsAB5tzhCSt5Wf9+Qpw4Ptvr7FIdfhg
         1wbEQJbD86jMRRGy1YYl+Wha7BFYTDs41jEcjcTPqraXk8tKlSCgKtkU1Z4DgqYW1Gxu
         d3lL4Vi8pMUduwwfZh8B8MO42eGldoVLun3ZOUMuPUFdqnQQZK4Xqkp4G419wbEwtyqJ
         fhjpilNmBqnkgg5mpFwRq9SVn3WmlkYrqgcc+reUZwb83A/cDE741HuIyP8625GtPxJS
         DbsQ==
X-Gm-Message-State: ANhLgQ2tE+q/U/swyFrTXabxXVeRhA6pNcf8pwHScd3WOJInpORB7/9s
        NsHIBeJ2yNjChXRcNCSWSTIyMCMUgunuZpwh5RpyVw==
X-Google-Smtp-Source: ADFU+vt+cTzF+W4m9ZuLrugVE31A2dI3lE2J9BIpQq/GwEAFV9ZK8xkEnolSrCBv/dwQ0MPPETibjSvK5e83+lwRFIU=
X-Received: by 2002:a6b:dc05:: with SMTP id s5mr86042ioc.72.1583428511510;
 Thu, 05 Mar 2020 09:15:11 -0800 (PST)
MIME-Version: 1.0
References: <20200221101936.16833-1-t-kristo@ti.com> <20200221101936.16833-16-t-kristo@ti.com>
 <20200304224220.GC2799@xps15> <28ab188e-9e6e-35dd-c423-30aaa80afb90@ti.com>
In-Reply-To: <28ab188e-9e6e-35dd-c423-30aaa80afb90@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 5 Mar 2020 10:15:00 -0700
Message-ID: <CANLsYkwKUQZ=xxG5Xox7G+7J6VYDriJAUckY3WH56pQRtwE=Rw@mail.gmail.com>
Subject: Re: [PATCHv7 15/15] remoteproc/omap: Switch to SPDX license identifiers
To:     Suman Anna <s-anna@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        "Andrew F. Davis" <afd@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 4 Mar 2020 at 17:24, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Mathieu,
>
> On 3/4/20 4:42 PM, Mathieu Poirier wrote:
> > On Fri, Feb 21, 2020 at 12:19:36PM +0200, Tero Kristo wrote:
> >> From: Suman Anna <s-anna@ti.com>
> >>
> >> Use the appropriate SPDX license identifiers in various OMAP remoteproc
> >> source files and drop the previous boilerplate license text.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> >> ---
> >>  drivers/remoteproc/omap_remoteproc.h | 27 +--------------------------
> >>  1 file changed, 1 insertion(+), 26 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
> >> index 13f17d9135c0..828e13256c02 100644
> >> --- a/drivers/remoteproc/omap_remoteproc.h
> >> +++ b/drivers/remoteproc/omap_remoteproc.h
> >> @@ -1,35 +1,10 @@
> >> +/* SPDX-License-Identifier: BSD-3-Clause */
> >
> > This is odd considering omap_remoteproc.c is GPL-2.0-only
>
> We were using these enums on the firmware-side as well. The first
> version of this in v1 [1] is actually using Dual BSD and GPL-2.0-only,
> but even that one had posed some questions, so just converting to use
> the SPDX for the original license text.

Very well.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>
> regards
> Suman
>
> [1] https://patchwork.kernel.org/patch/11215415/
> >
> > Thanks,
> > Mathieu
> >
> >>  /*
> >>   * Remote processor messaging
> >>   *
> >>   * Copyright (C) 2011-2020 Texas Instruments, Inc.
> >>   * Copyright (C) 2011 Google, Inc.
> >>   * All rights reserved.
> >> - *
> >> - * Redistribution and use in source and binary forms, with or without
> >> - * modification, are permitted provided that the following conditions
> >> - * are met:
> >> - *
> >> - * * Redistributions of source code must retain the above copyright
> >> - *   notice, this list of conditions and the following disclaimer.
> >> - * * Redistributions in binary form must reproduce the above copyright
> >> - *   notice, this list of conditions and the following disclaimer in
> >> - *   the documentation and/or other materials provided with the
> >> - *   distribution.
> >> - * * Neither the name Texas Instruments nor the names of its
> >> - *   contributors may be used to endorse or promote products derived
> >> - *   from this software without specific prior written permission.
> >> - *
> >> - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> >> - * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> >> - * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> >> - * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> >> - * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> >> - * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> >> - * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> >> - * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> >> - * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> >> - * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> >> - * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> >>   */
> >>
> >>  #ifndef _OMAP_RPMSG_H
> >> --
> >> 2.17.1
> >>
> >> --
> >> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>
