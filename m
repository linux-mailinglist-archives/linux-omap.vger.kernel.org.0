Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1A5ADF425
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 19:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbfJUR0C (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 13:26:02 -0400
Received: from muru.com ([72.249.23.125]:38610 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbfJUR0C (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 13:26:02 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 95D3A810A;
        Mon, 21 Oct 2019 17:26:35 +0000 (UTC)
Date:   Mon, 21 Oct 2019 10:25:57 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
Message-ID: <20191021172557.GB5610@atomide.com>
References: <cover.1571424390.git.hns@goldelico.com>
 <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
 <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com>
 <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [191021 15:46]:
> > Am 21.10.2019 um 17:07 schrieb Rob Herring <robh+dt@kernel.org>:
> > On Fri, Oct 18, 2019 at 1:46 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >> +Optional properties:
> >> +- timer:       the timer to be used by the driver.
> > 
> > Needs a better description and vendor prefix at least.
> 
> I am not yet sure if it is vendor specific or if all
> SGX implementations need some timer.
> 
> > 
> > Why is this needed rather than using the OS's timers?
> 
> Because nobody understands the current (out of tree and
> planned for staging) driver well enough what the timer
> is doing. It is currently hard coded that some omap refer
> to timer7 and others use timer11.

Just configure it in the driver based on the compatible
value to keep it out of the dts. It's best to stick to
standard bindings.

> >> +- img,cores:   number of cores. Defaults to <1>.
> > 
> > Not discoverable?
> 
> Not sure if it is. This is probably available in undocumented
> registers of the sgx.

This too, and whatever non-standrd other properities
you might have.

Regards,

Tony
