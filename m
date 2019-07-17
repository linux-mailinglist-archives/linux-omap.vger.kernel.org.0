Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 479C36C0D9
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jul 2019 20:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfGQSPA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Jul 2019 14:15:00 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:34290 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbfGQSPA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Jul 2019 14:15:00 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id C0BCD20020;
        Wed, 17 Jul 2019 20:14:56 +0200 (CEST)
Date:   Wed, 17 Jul 2019 20:14:55 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Belisko Marek <marek.belisko@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [Letux-kernel] [PATCH v3 0/5] drm/panel-simple: Add panel
 parameters for ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
Message-ID: <20190717181455.GB6522@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com>
 <20190625204356.GF18595@ravnborg.org>
 <20190626073350.GA15288@ravnborg.org>
 <CF1D9929-58D2-4E75-932A-870D11BBFBDE@goldelico.com>
 <33D92C0E-A430-4C34-A698-646F2592093D@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33D92C0E-A430-4C34-A698-646F2592093D@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=ECr_sb-4hz7xPOuor7MA:9 a=CjuIK1q_8ugA:10
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus.

> >>>> BTW: should also be applied to 5.2
> >>> The drm bits are reviewed. The DT bits needs OK from DT people.
> >>> When we have OK from DT people we can apply them all to drm-misc-next.
> >> 
> >> I got OK on irc from Rob to process these.
> >> All patches are now applied to drm-misc-next.
> > 
> > Thanks for taking care of this!
> 
> I have checked but it seems they are still not merged into linux-next.

They will appear in next merge window. They were to late to hit current
merge window, as the cut-of time is around .rc5 in the drm subsystem.
And this is not really a fix so not stable material.

	Sam
