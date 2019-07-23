Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E07617123B
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 08:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732245AbfGWG7m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 02:59:42 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:35609 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfGWG7m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Jul 2019 02:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563865180;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=HMzGT/OWeM8K38nQoAk3mo3OqufNI1pKnUDvqT6/cQs=;
        b=FVjTuMHqDvjkEG/vuqqhOP+HhQf8ysADLQAQCZXBn2CcjTWDqGV+VqILiJIVi0/B1V
        UKC5IT0yeuwPS3hHpom2IFtWnriVc2CQReJAlEaqu5SJPn99e9w7HAaRUF9K4QijmSWn
        prK8aeZAUayMHFILwR8u9yK+GZ8vEuO0kzol6UcGjyTpyHMKKR0MvugmX0REc7gjEfzG
        6oj/8wHWRx2sCAFgSRtfP/7D+pwCmah1q3gHtDfjrCLnDNZu6aW71Swc8CkavEb5ivrW
        s2tlvuttkN2tQPwmBxNvzWdETu/Ic4WdxUZGMuvKFC3FtaI/Xs2Wp2WXAK2+DphXd/CT
        peCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCzzAWjYNpPLf7dKT9br2BTgS7Wra5BtV3XNo7sm"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:26fe:7700:487b:93ce:9f6c:e3a4]
        by smtp.strato.de (RZmta 44.24 AUTH)
        with ESMTPSA id j00b6dv6N6xJJkB
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 23 Jul 2019 08:59:19 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [PATCH v3 0/5] drm/panel-simple: Add panel parameters for ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190717181455.GB6522@ravnborg.org>
Date:   Tue, 23 Jul 2019 08:59:29 +0200
Cc:     Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Belisko Marek <marek.belisko@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: 7bit
Message-Id: <201E8D0D-96A3-4E32-AF88-030879162F61@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com> <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com> <20190625204356.GF18595@ravnborg.org> <20190626073350.GA15288@ravnborg.org> <CF1D9929-58D2-4E75-932A-870D11BBFBDE@goldelico.com> <33D92C0E-A430-4C34-A698-646F2592093D@goldelico.com> <20190717181455.GB6522@ravnborg.org>
To:     Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sam,

> Am 17.07.2019 um 20:14 schrieb Sam Ravnborg <sam@ravnborg.org>:
> 
> Hi Nikolaus.
> 
>>>>>> BTW: should also be applied to 5.2
>>>>> The drm bits are reviewed. The DT bits needs OK from DT people.
>>>>> When we have OK from DT people we can apply them all to drm-misc-next.
>>>> 
>>>> I got OK on irc from Rob to process these.
>>>> All patches are now applied to drm-misc-next.
>>> 
>>> Thanks for taking care of this!
>> 
>> I have checked but it seems they are still not merged into linux-next.
> 
> They will appear in next merge window. They were to late to hit current
> merge window, as the cut-of time is around .rc5 in the drm subsystem.
> And this is not really a fix so not stable material.

have finally arrived. I just wasn't patient enough :)

BR and thanks,
Nikolaus

