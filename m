Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4B199D28F
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 17:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731138AbfHZPTM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 11:19:12 -0400
Received: from muru.com ([72.249.23.125]:58656 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727850AbfHZPTM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Aug 2019 11:19:12 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 03B1780AA;
        Mon, 26 Aug 2019 15:19:40 +0000 (UTC)
Date:   Mon, 26 Aug 2019 08:19:08 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     grygorii <grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 0/3] Drop platform data for cpsw for am3/4 and dra7
Message-ID: <20190826151908.GU52127@atomide.com>
References: <20190814101949.50006-1-tony@atomide.com>
 <a4467e6c-88f3-eac8-322a-c0e40360ba36@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4467e6c-88f3-eac8-322a-c0e40360ba36@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* grygorii <grygorii.strashko@ti.com> [190815 16:44]:
> Hi Tony,
> 
> On 14/08/2019 13:19, Tony Lindgren wrote:
> > Hi all,
> > 
> > Here are changes to drop legacy platform data for cpsw for am3, am4
> > and dra7. Please review and test, I was not able to boot my beagle
> > x15 as it seems to have a power supply problem and have only tested
> > on am3 and 4.
> 
> 
> Thank you.
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

Just to update the beagle x15 status, the issue I was seeing turned
out to be hung ftdi serial driver on my PC instead of a power supply
problem. Reloading USB modules fixed that.

Regards,

Tony
