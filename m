Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6972FFCB31
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2019 17:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfKNQ5j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Nov 2019 11:57:39 -0500
Received: from muru.com ([72.249.23.125]:42254 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726852AbfKNQ5i (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 Nov 2019 11:57:38 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 96AE880E7;
        Thu, 14 Nov 2019 16:58:15 +0000 (UTC)
Date:   Thu, 14 Nov 2019 08:57:35 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com
Subject: Re: [PATCH] ARM: dts: logicpd-torpedo-baseboard:  Enable HDQ
Message-ID: <20191114165735.GS5610@atomide.com>
References: <20191112171156.5952-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112171156.5952-1-aford173@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191112 09:12]:
> The baseboard of the Logic PD Torpedo development kit has a socket
> for a rechargable battery.  The battery is monitored by a charger
> which can communicate of the the 1-wire HDQ pin.
> 
> This patch enables the pinmux for the HDQ pin.

Applying into omap-for-v5.5/dt thanks. As we're close to the
merge window, these may need to wait we'll see.

Regards,

Tony
