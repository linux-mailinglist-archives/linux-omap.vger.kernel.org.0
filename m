Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF6BE11EBCE
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 21:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbfLMUYT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 15:24:19 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34424 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728991AbfLMUYT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Dec 2019 15:24:19 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBDKNpgl067054;
        Fri, 13 Dec 2019 14:23:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576268631;
        bh=sQLULXVT4AjiaBKiWEV7xPXBEYis+u7qmi7okgEmQfU=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=f0LGfpZQdoMN1qYM35SgsRdeinQyvo3di6zm7CPxLGLxGBz8J04e2xisTkHHR7un8
         S+01GRg3QXwc1wCp6UkWNGPyf4k4XXV7eCg8uurMBkD4ZHVEFdJtnz/BRYLzchLM2U
         oL5J+DkWhELRO+R2j8MasgYQlqLpRDqgmj0QTofU=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBDKNp4m042728;
        Fri, 13 Dec 2019 14:23:51 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Dec 2019 14:23:51 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Dec 2019 14:23:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBDKNoix051357;
        Fri, 13 Dec 2019 14:23:50 -0600
Date:   Fri, 13 Dec 2019 14:23:14 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv2 0/7] musb host improvments mostly for omap2430 glue
Message-ID: <20191213202314.GL16429@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>, Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>, NeKit <nekit1000@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
References: <20191009212145.28495-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191009212145.28495-1-tony@atomide.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Wed, Oct 09, 2019 at 02:21:37PM -0700, Tony Lindgren wrote:
> Hi,
> 
> Here's v2 set of musb clean-up mostly for the 2430 glue layer.
> 
> Regards,
> 
> Tony
> 
> 
> Changes since v1:
> 
> - Get rid of set_vbus stuff
> 
> 
> Tony Lindgren (7):
>   usb: musb: omap2430: Get rid of musb .set_vbus for omap2430 glue
>   usb: musb: omap2430: Wait on enable to avoid babble
>   usb: musb: omap2430: Handle multiple ID ground interrupts
>   usb: musb: Add musb_set_host and peripheral and use them for omap2430
>   usb: musb: omap2430: Clean up enable and remove devctl tinkering
>   usb: musb: omap2430: Idle musb on init
>   usb: musb: Get rid of omap2430_musb_set_vbus()
> 
>  drivers/usb/musb/musb_core.c | 103 ++++++++++++++++++++++
>  drivers/usb/musb/musb_core.h |   3 +
>  drivers/usb/musb/omap2430.c  | 164 ++++++++++-------------------------
>  3 files changed, 152 insertions(+), 118 deletions(-)

The series is queued for -next. Thanks.

-Bin.
