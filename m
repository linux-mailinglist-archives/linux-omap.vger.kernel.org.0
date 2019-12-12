Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F07111D3B3
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730113AbfLLRWn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:22:43 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34618 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730088AbfLLRWn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 12:22:43 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCHMXIK028310;
        Thu, 12 Dec 2019 11:22:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576171353;
        bh=QGCM1IVHZ0ASpgVGFJSeS05MP+Yz/9LnTm5rnylqCN4=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=eS/8LXYf5U412lfFvwNZ4xnyxQafP0FsBoT95vlDgpv3VqR3rrDaRIWHl5E8W8Z9p
         879JNF/NsZBdm7vg3B4hluT7TNCVbBcMAE8B2SM9p22fsIbhgGa8qOEVqs+ROitcFB
         Shm41jjFtf8F8tP6vi+oUHCuruzT8RdJjnJPD3aY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCHMX3g123443
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 11:22:33 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 11:22:33 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 11:22:33 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCHMXBr039533;
        Thu, 12 Dec 2019 11:22:33 -0600
Date:   Thu, 12 Dec 2019 11:21:57 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] usb: musb: fix idling for suspend after disconnect
 interrupt
Message-ID: <20191212172157.GJ16429@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Tony Lindgren <tony@atomide.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
References: <20191126034151.38154-1-tony@atomide.com>
 <5ae7f3aa-3992-a810-f5d4-0b5bb8fa6356@cogentembedded.com>
 <20191126174515.GZ35479@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191126174515.GZ35479@atomide.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 26, 2019 at 09:45:15AM -0800, Tony Lindgren wrote:
> * Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> [191126 10:21]:
> > Hello!
> > 
> > On 26.11.2019 6:41, Tony Lindgren wrote:
> > 
> > > When disconnected as USB B-device, we sometimes get a suspend interrupt
> > > after disconnect interrupt. In that case we have devctl set to 99 with
> > > VBUS still valid and musb_pm_runtime_check_session() wrongly things we
> > 
> >     Thinks?
> 
> Thanks will fix.

Is this the only update needed? I can fix it locally when queuing the
patch.

-Bin.
