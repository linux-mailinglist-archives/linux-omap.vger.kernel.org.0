Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D83F23476D
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jul 2020 16:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387551AbgGaOJ4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 Jul 2020 10:09:56 -0400
Received: from vern.gendns.com ([98.142.107.122]:59974 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728206AbgGaOJ4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 31 Jul 2020 10:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uhr1FkrbzJP+ktsQ0F06FBzGwyo/2pwFjqU1eObbgKI=; b=GtFv6CAZhVAD4dCEZa/ZzJslzX
        8oNvux7EQ3kc3SNhHO44VYEXi7IRKrmGVpTp+W6n8Ut8UfiYSZFoW07RAW5SdX479Azrr0y6dI/Ey
        cTzq10mnJFT1EIFzp3fQkdG3YvZOyfzpCZeNs8X5kNZu0TdEhRwArBNawKO9zMll4maVQZpVgffKq
        xwwmKvKn03W/9V1+jO1oKjBUeY04EzT8rdR1P8U0GkDPI0lwZCDhAEPl2uo2Xb2BixU5Os9CZj6gF
        L6TZmnp+stBbthHGBcMw3fDfdaWuwP1l7JITHTKFDyz9yryk5F87sKmDTJ/1dm2l8yIg0wNaPQlm6
        l5UI3I+g==;
Received: from [2600:1700:4830:165f::19e] (port=57672)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1k1VjK-0003Z3-S1; Fri, 31 Jul 2020 10:09:51 -0400
Subject: Re: [PATCH v4 1/5] dt-bindings: irqchip: Add PRU-ICSS interrupt
 controller bindings
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>, "Anna, Suman" <s-anna@ti.com>,
        robh+dt@kernel.org, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Mills, William" <wmills@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1595927918-19845-2-git-send-email-grzegorz.jaszczyk@linaro.org>
 <01bac597-c1a0-1851-b630-a79929777a16@lechnology.com>
 <CAMxfBF6Ru1Fm1oWDyrSM=kBdCUe+eUDChqDgoYo4ziVr-8c50Q@mail.gmail.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <19fbf4f6-ea75-3eb7-7e95-c7c9ce987996@lechnology.com>
Date:   Fri, 31 Jul 2020 09:09:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMxfBF6Ru1Fm1oWDyrSM=kBdCUe+eUDChqDgoYo4ziVr-8c50Q@mail.gmail.com>
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

On 7/31/20 6:48 AM, Grzegorz Jaszczyk wrote:
> On Wed, 29 Jul 2020 at 19:34, David Lechner <david@lechnology.com> wrote:
>> It is not clear what the meaning of each cell is. Looking at later patches, it
>> looks like the first cell is the PRU system event number, the second cell is the
>> channel and the third cell is the host event number.
> 
> Ok, how about updating above description like this:
> Client users shall use the PRU System event number (the interrupt source
> that the client is interested in) [cell 1], PRU channel [cell 2] and PRU
> host_intr (target) [cell 3] as the value of the interrupts property in their
> node.  The system events can be mapped to some output host interrupts through 2
> levels of many-to-one mapping i.e. events to channel mapping and channels to
> host interrupts so through this property entire mapping is provided.

Cell 3 is host_intr0-7? How would we map to other host events?
