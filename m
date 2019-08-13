Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA6698B550
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 12:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728795AbfHMKUz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 06:20:55 -0400
Received: from muru.com ([72.249.23.125]:57066 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727053AbfHMKUy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 13 Aug 2019 06:20:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A6CF5805C;
        Tue, 13 Aug 2019 10:21:21 +0000 (UTC)
Date:   Tue, 13 Aug 2019 03:20:50 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Emmanuel Vadot <manu@freebsd.org>
Cc:     bcousson@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: dts: am335x: Fix UARTs length
Message-ID: <20190813102050.GH52127@atomide.com>
References: <20190724122329.21231-1-manu@freebsd.org>
 <20190724122329.21231-2-manu@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724122329.21231-2-manu@freebsd.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Emmanuel Vadot <manu@freebsd.org> [190724 05:24]:
> As seen on the AM335x TRM all the UARTs controller only are 0x1000 in size.
> Fix this in the DTS.

Thanks applying into fixes.

FYI, the module size is usually (but not always) 0x1000 with additional
0x1000 for the interconnect related registers.

Regards,

Tony
