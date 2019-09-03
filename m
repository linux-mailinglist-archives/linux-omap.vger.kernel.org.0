Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C018A6902
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 14:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbfICMwu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 08:52:50 -0400
Received: from muru.com ([72.249.23.125]:59528 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728538AbfICMwu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Sep 2019 08:52:50 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D3BAB80CF;
        Tue,  3 Sep 2019 12:53:19 +0000 (UTC)
Date:   Tue, 3 Sep 2019 05:52:46 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: Linux-next: File system over NFS broken on DRA7/AM5 platforms
Message-ID: <20190903125246.GK52127@atomide.com>
References: <b5f54d5f-4790-7be1-cb65-847a98d2e8dd@ti.com>
 <c32b9e04-b230-7634-051b-202868597ec1@ti.com>
 <59564d54-c032-7ca0-3130-6fa7d10f43b7@ti.com>
 <c89bd1cb-be2b-eceb-4c3d-144dc9bb951a@ti.com>
 <17acc359-5938-5f43-3f20-c8de93556748@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17acc359-5938-5f43-3f20-c8de93556748@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Grygorii Strashko <grygorii.strashko@ti.com> [190903 12:46]:
> On 03/09/2019 13:38, Tero Kristo wrote:
> > The failure with the DTS patch might be because the sequencing differences between hwmod based implementation to ti-sysc based one,
>  I guess GMAC has been switched over from hwmod to ti-sysc.
> 
> Right and this patch just reveals existing issue.

Any ideas why nfsroot keeps working in next for beagle-x15 though?

Is cpsw wired in a different way for beagle-x15?

Regards,

Tony
