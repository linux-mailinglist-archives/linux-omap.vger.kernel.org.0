Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFFA7E078D
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 17:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732384AbfJVPgy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 11:36:54 -0400
Received: from muru.com ([72.249.23.125]:38904 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731450AbfJVPgy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 11:36:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EF18F80FA;
        Tue, 22 Oct 2019 15:37:27 +0000 (UTC)
Date:   Tue, 22 Oct 2019 08:36:50 -0700
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
Message-ID: <20191022153650.GL5610@atomide.com>
References: <cover.1571424390.git.hns@goldelico.com>
 <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
 <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com>
 <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com>
 <20191021172557.GB5610@atomide.com>
 <C6CD5A50-7F0A-4F56-ABB9-CAEDF7E47A5D@goldelico.com>
 <20191022150202.GJ5610@atomide.com>
 <CC62CE92-28DF-406E-B61C-22F8F341AAFB@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CC62CE92-28DF-406E-B61C-22F8F341AAFB@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [191022 15:12]:
> Hm. How should that work? Some SoC have the sgx544 as single
> core and others as dual core. This imho does not fit into
> the "img,sgx544-$revision" scheme which could be matched to.

Well don't you have then just two separate child nodes,
one for each core with their own register range?

That is assuming they're really separate instances..

> But maybe we do it the same as with the timer for the moment,
> i.e. keep it in some unpublished patch set.

Yeah makes sense to me until things get sorted out.

> At the moment I have more problems understanding how the yaml
> thing works. I understand and fully support the overall goal,
> but it is quite difficult to get a start here. And there do not
> seem to be tools or scripts to help converting from old style
> text format (even if not perfect, this would be helpful) and
> I have no yaml editor that helps keeping the indentation
> correct. So this slows down a v2 a little bit.

Sounds handy to me :)

Regards,

Tony
