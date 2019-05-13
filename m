Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8C4B1BB0F
	for <lists+linux-omap@lfdr.de>; Mon, 13 May 2019 18:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbfEMQhS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 May 2019 12:37:18 -0400
Received: from muru.com ([72.249.23.125]:48740 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728639AbfEMQhS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 May 2019 12:37:18 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1D05C8047;
        Mon, 13 May 2019 16:37:37 +0000 (UTC)
Date:   Mon, 13 May 2019 09:37:15 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Cc:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: Kernel Oops when something is executed from within the initramfs
Message-ID: <20190513163715.GW8007@atomide.com>
References: <50042d920efa281582ed8b5486ea89456ad4de65.camel@ts.fujitsu.com>
 <20190510145441.GU8007@atomide.com>
 <e22ceb01c9f2d9136e44475962d570af0d489d7a.camel@ts.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e22ceb01c9f2d9136e44475962d570af0d489d7a.camel@ts.fujitsu.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* thilo.cestonaro@ts.fujitsu.com <thilo.cestonaro@ts.fujitsu.com> [190513 14:51]:
> Hi Tony,
> 
> thanks for your answer. Sadly it's not an overlapping issue.
> I even printed the first four and the last four bytes of the initramfs before the kernel decompresses it,
> so I can be sure. And the bytes fit the bytes of my initramfs.

OK

> Any other hint why I can't execute anything from within the initramfs?

Maybe check with current mainline Linux kernel and beaglebone
that initramfs behaves and then narrow it down from there?

Regards,

Tony
