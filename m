Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C240A132A65
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 16:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbgAGPsv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 10:48:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:38408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727559AbgAGPsv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jan 2020 10:48:51 -0500
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2808B208C4;
        Tue,  7 Jan 2020 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578412130;
        bh=m8JJwNYYUN0cI55b1bIkcqX+lHoyiGdFR/bK6o9/YMk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ELXoZKRxKo7R5r0mofZ53Y2FWh9zmTp8Em7ycLJvHJf4OqA5sB+SWyYHMx6PYHiW8
         1SdZWYOp5ry24NfKanSDjxT+3mJwXwoHZzoLNzGatOug0DNWynZwYyxrwPvimiJC43
         tqXQBu1Ql2Xbt7AXCx8y8V88zAKKdEfCG1CZV4Bg=
Received: by mail-qk1-f177.google.com with SMTP id x1so42991749qkl.12;
        Tue, 07 Jan 2020 07:48:50 -0800 (PST)
X-Gm-Message-State: APjAAAXcYavMc5KQwjAZ1UVHcMY2HSzyFsBoRb8ipZJRgAu9RoXk8Hcu
        frfxC9G5U8zzawvv/jur1dK9PZ8Proswwbc57Q==
X-Google-Smtp-Source: APXvYqw42izep83otEMcE93AOoYtZ0fOAGbAAx5hxU3nM1+/TcTF1GLkofhxJo86KQeQJMXepNDVqz6q6bljFjDWx4M=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr89412395qkg.152.1578412129283;
 Tue, 07 Jan 2020 07:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20200102131845.12992-2-t-kristo@ti.com> <20200102132512.13248-1-t-kristo@ti.com>
 <20200103233855.GA19897@bogus> <358abb44-7724-4e25-6a3d-6939ec82386a@ti.com>
In-Reply-To: <358abb44-7724-4e25-6a3d-6939ec82386a@ti.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 7 Jan 2020 09:48:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJY8fzQ8=e=RHrtq1huucx6msqXJ+C6EcoaofBqRf9yLQ@mail.gmail.com>
Message-ID: <CAL_JsqJY8fzQ8=e=RHrtq1huucx6msqXJ+C6EcoaofBqRf9yLQ@mail.gmail.com>
Subject: Re: [RESEND PATCHv4 01/14] dt-bindings: remoteproc: Add OMAP
 remoteproc bindings
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jan 7, 2020 at 5:01 AM Tero Kristo <t-kristo@ti.com> wrote:
>
> On 04/01/2020 01:38, Rob Herring wrote:
> > On Thu, Jan 02, 2020 at 03:25:12PM +0200, Tero Kristo wrote:
> >> From: Suman Anna <s-anna@ti.com>
> >>
> >> Add the device tree bindings document for the IPU and DSP
> >> remote processor devices on OMAP4+ SoCs.
> >>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: devicetree@vger.kernel.org
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> [t-kristo@ti.com: converted to schema]
> >> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> >> ---
> >> v4: added ti,bootreg-shift and ti,autosuspend-delay properties
> >>
> >>   .../remoteproc/ti,omap-remoteproc.yaml        | 329 ++++++++++++++++++
> >>   1 file changed, 329 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml


> >> +  reg:
> >> +    description: |
> >> +      Address space for any remoteproc memories present on
> >> +      the SoC. Should contain an entry for each value in
> >> +      'reg-names'. These are mandatory for all DSP and IPU
> >> +      processors that have them (OMAP4/OMAP5 DSPs do not have
> >> +      any RAMs)
> >> +
> >> +  reg-names:
> >> +    description: |
> >> +      Required names for each of the address spaces defined in
> >> +      the 'reg' property. Should contain a string from among
> >> +      the following names, each representing the corresponding
> >> +      internal RAM memory region.
> >
> > The schema is more constrained than 'a string from among the following
> > names'. 'l2ram' is the only valid 1st entry for example.
>
> Right, I wasn't able to figure out a way to make the schema more
> flexible, so I will just modify the description above.

The goal is somewhat to not be flexible as we want the possible
combinations defined. If it is a manageable number of combinations,
just list them out under a 'oneOf'.

Not encouraged, but it is possible to define any length and order of
values (note 'items' is not a list here):

items:
  enum: [ ... ]

Rob
