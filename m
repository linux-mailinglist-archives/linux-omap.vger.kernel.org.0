Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 984A51CBC1
	for <lists+linux-omap@lfdr.de>; Tue, 14 May 2019 17:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfENPX2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 May 2019 11:23:28 -0400
Received: from muru.com ([72.249.23.125]:49052 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbfENPX2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 14 May 2019 11:23:28 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0D72980E7;
        Tue, 14 May 2019 15:23:46 +0000 (UTC)
Date:   Tue, 14 May 2019 08:23:21 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Cc:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: Kernel Oops when something is executed from within the initramfs
Message-ID: <20190514152321.GA5447@atomide.com>
References: <50042d920efa281582ed8b5486ea89456ad4de65.camel@ts.fujitsu.com>
 <20190510145441.GU8007@atomide.com>
 <e22ceb01c9f2d9136e44475962d570af0d489d7a.camel@ts.fujitsu.com>
 <20190513163715.GW8007@atomide.com>
 <15ad78802c0c78b0766cdda4e34caecfec054800.camel@ts.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15ad78802c0c78b0766cdda4e34caecfec054800.camel@ts.fujitsu.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* thilo.cestonaro@ts.fujitsu.com <thilo.cestonaro@ts.fujitsu.com> [190514 15:21]:
> Thanks for all help.
> I gave up on 4.4.179 ... but succeeded to rebase to 5.1 which is much better so ;).

OK good to hear :) Sounds like 4.4 stable might have some issue then..

Regards,

Tony
