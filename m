Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1769FCC1B
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2019 18:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbfKNRrK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Nov 2019 12:47:10 -0500
Received: from muru.com ([72.249.23.125]:42292 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725976AbfKNRrK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 Nov 2019 12:47:10 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 13CEC80E7;
        Thu, 14 Nov 2019 17:47:44 +0000 (UTC)
Date:   Thu, 14 Nov 2019 09:47:05 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Caleb Robey <c-robey@ti.com>
Cc:     linux-omap@vger.kernel.org, Jason Kridner <jkridner@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Jason Kridner <jdk@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Andreas Dannenberg <dannenberg@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Tom Rini <trini@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: am5729: beaglebone-ai: dra7 reqs in dts
Message-ID: <20191114174705.GV5610@atomide.com>
References: <20191114170933.12623-1-c-robey@ti.com>
 <20191114170933.12623-2-c-robey@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114170933.12623-2-c-robey@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Caleb Robey <c-robey@ti.com> [191114 17:11]:

Hmm I think this one is still missing

From: Jason Kridner <jdk@ti.com>

If this too is Jason's patch? This happens if you apply a patch
manually instead of applying an email with git am.

You might be able to just change the From: line with
git commit --amend.

Regards,

Tony
