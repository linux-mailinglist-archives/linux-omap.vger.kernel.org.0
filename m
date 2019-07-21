Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9D36F14C
	for <lists+linux-omap@lfdr.de>; Sun, 21 Jul 2019 04:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbfGUCmw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 20 Jul 2019 22:42:52 -0400
Received: from vern.gendns.com ([98.142.107.122]:34186 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726184AbfGUCmw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 20 Jul 2019 22:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QBCxrWgQQvbzcSHUE+6V5GYiHh8kl0xDb7n2C2WZI1U=; b=evrWp+eTbUOlJMWIwZri5RT/jU
        5WhW7H5EVxsOoU+e2v3rKQ7Km5/PUUkYGhesGGviICzbRx3A91I3Vzubr/CQlLVm0RXw2IRQz6wAE
        vgWLHpoJzvSy3hVcQEri0fNKnaoyLMzFurmu3Xs4LEhZ6guZv2tBxI/E/fLwHG8fUSnAFzOdfFXfU
        xpD5ZTWPoR5W/HBaDvCVr0hCFbB3KeJQDhgE3GtXRx9THOkDA2szgseW7aZgURr3RemxHOgCi9jsi
        lyA0Tx2lZ9fogw0qJ1pp5SoiDLm8thW7iUj8dxrQh+ozh5AKwYWwmIiN6X72qPEUrRMeMNrkqJoCL
        /uXUpnDw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:51266 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hp1oH-001YcK-CZ; Sat, 20 Jul 2019 22:42:49 -0400
Subject: Re: [PATCH 1/4] ARM: OMAP2+: Drop mmc platform data for am330x and
 am43xx
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
References: <20190326181324.32140-1-tony@atomide.com>
 <20190326181324.32140-2-tony@atomide.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <0af63198-5a68-2f0d-f14e-2b514580d2d5@lechnology.com>
Date:   Sat, 20 Jul 2019 21:42:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190326181324.32140-2-tony@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 3/26/19 1:13 PM, Tony Lindgren wrote:
> We can now drop legacy platform data one interconnect target module at
> a time in favor of the device tree based data that has been added earlier.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

This breaks wifi on BeagleBone Blue (found via git bisect). In dmesg, I see:

     platform 47810000.mmc: Cannot lookup hwmod 'mmc3'

How can we fix it?
