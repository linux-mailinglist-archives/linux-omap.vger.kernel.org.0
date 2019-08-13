Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4BD8AE8D
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 07:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfHMFI3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 01:08:29 -0400
Received: from muru.com ([72.249.23.125]:57030 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725786AbfHMFI3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 13 Aug 2019 01:08:29 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 074A280CC;
        Tue, 13 Aug 2019 05:08:56 +0000 (UTC)
Date:   Mon, 12 Aug 2019 22:08:26 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     =?utf-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] Enable 1GHz support on omap36xx
Message-ID: <20190813050826.GE52127@atomide.com>
References: <20190801012823.28730-1-neolynx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190801012823.28730-1-neolynx@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* André Roth <neolynx@gmail.com> [190801 01:29]:
> the current mainline kernel does not provide support for running
> omap36xx based boards at 1GHz for chips like DM3730 where this would be
> supported. It has been discussed many times, I hope you do not mind me
> bringing this up again ;)

Good to see some progress on this one :)
...

> @Nishanth: could you confirm that DM3730 (1GHz version) is properly
> configured for running at 1GHz ? (I know this is a tricky question and
> has been asked before...)
> 
> As this is just a hack, I would like to know how to properly
> initialize those driver in the right order, preferably via device tree
> or kernel config instead of a board file.

I agree device tree configuration is the way to go here. That way we
can configure one board at a time as needed after it's been verified
to work properly.

Regards,

Tony
