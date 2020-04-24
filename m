Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653051B7A9F
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgDXPvb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:51:31 -0400
Received: from muru.com ([72.249.23.125]:51250 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727109AbgDXPvb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Apr 2020 11:51:31 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8DFD280E7;
        Fri, 24 Apr 2020 15:52:19 +0000 (UTC)
Date:   Fri, 24 Apr 2020 08:51:28 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, s-anna@ti.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/17] ARM: dts: dra7/am57xx: remoteproc support
Message-ID: <20200424155128.GK37466@atomide.com>
References: <20200424151244.3225-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424151244.3225-1-t-kristo@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200424 08:13]:
> Hi Tony,
> 
> This series adds the DT nodes necessary for remoteproc support, now that
> the driver side changes are (mostly) in. Couple of things to note
> though.
> 
> 1) There is a new IOMMU issue, for which I posted a fix today [1]
> 2) The remoteproc core still has an issue for which there is ongoing
>    discussion [2]
> 
> With these two issue taken care of, the omap remoteproc support is
> functional. The question though is, whether we should just wait until
> the above two issues are resolved and merge the DT patches post that, or
> merge the DT patches with status = "disabled".

If there are no dependencies between the pending driver fixes and
the dts changes I see no reason to not merge the dts changes.

> There aren't any boot failures without the mentioned two issues though,
> as one needs to enable the RPMSG_VIRTIO support before the failures
> really kick in (issue [2]), and this config is not enabled for OMAPs
> yet. Also, multi-v7 config doesn't seem to enable omap remoteproc,
> so that is safe also.

OK thanks for checking that.

> Another thing I was considering myself was to squash all the board
> specific reserved-memory region patches into the
> dra7-ipu-dsp-common.dtsi files. However Suman wants to have these
> separate and as he is the actual author for these, I posted them in this
> form. But anyway, just so you know it would be possible to merge them
> together.

OK. The combining of common features can be done in later patches
too.

Regards,

Tony

> [1] https://lore.kernel.org/linux-iommu/20200424145828.3159-1-t-kristo@ti.com/T/#u
> [2] https://lkml.org/lkml/2020/4/20/1094
