Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48942348D5
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jul 2020 18:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387527AbgGaP7U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 Jul 2020 11:59:20 -0400
Received: from vern.gendns.com ([98.142.107.122]:39878 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732550AbgGaP7T (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 31 Jul 2020 11:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=KoJsXkNu7DAyQrTk2uXCbdsXihbEgsCL9cGJchq1F8w=; b=DxFLoarDW+UuMDyz9jYWipRkY3
        E0+/N6ADKZlfSxwYVwlYL9IFUd26TMCrm24Whg0uRq93F22NOPdgw527QldMFn4FtDKlhcVq2+xqu
        B1RQ3xbMhWmG61tM/TzOPce7D8GSkWl5tXB7jwjNR04G1yiofyVI2RjgnXwTfNXs99OJo/bBGNesT
        e54frMGNfIpIEx4Pkon90PYqG99hwKMuD8RfUCP/kEDzOzTMe44Rs/JpbLwMms0KktWgAsLvUaROz
        3hjpcYvmZSJi5C6N73CIlLjdUdaY4rbo5SiSDs7E39vsC47u0C+m95iu69Lt+7m6Mc39vgtFPa0iH
        EBVGfJ4g==;
Received: from [2600:1700:4830:165f::19e] (port=60758)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1k1XRE-0004QC-7q; Fri, 31 Jul 2020 11:59:16 -0400
Subject: Re: [PATCH v4 4/5] irqchip/irq-pruss-intc: Implement
 irq_{get,set}_irqchip_state ops
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        "Anna, Suman" <s-anna@ti.com>, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Mills, William" <wmills@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1595927918-19845-5-git-send-email-grzegorz.jaszczyk@linaro.org>
 <f65c6b32-7754-9880-1912-3b0b30a3d6d4@lechnology.com>
 <CAMxfBF4--kP=tt-1LqMB=W8B6gHYu1vFFMtnLPgc-akeLiK-Yw@mail.gmail.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <71007a86-0a62-a180-33b7-7d963d39f84b@lechnology.com>
Date:   Fri, 31 Jul 2020 10:59:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMxfBF4--kP=tt-1LqMB=W8B6gHYu1vFFMtnLPgc-akeLiK-Yw@mail.gmail.com>
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

On 7/31/20 7:28 AM, Grzegorz Jaszczyk wrote:
> On Wed, 29 Jul 2020 at 21:23, David Lechner <david@lechnology.com> wrote:
>>
>> On 7/28/20 4:18 AM, Grzegorz Jaszczyk wrote:
>>> From: David Lechner <david@lechnology.com>
>>>
>>> This implements the irq_get_irqchip_state and irq_set_irqchip_state
>>> callbacks for the TI PRUSS INTC driver. The set callback can be used
>>> by drivers to "kick" a PRU by injecting a PRU system event.
>>>
>>> Example:
>>
>> We could improve this example by showing a device tree node of a
>> firmware-defined device implemented in the PRU:
>>
>>          /* Software-defined UART in PRU */
>>          pru_uart: serial@XXXX {
>>                  compatible = "ti,pru-uart";
>>                  ...
>>                  interrupt-parent = <&pruss_intc>;
>>                  /* PRU system event 31, channel 0, host event 0 */
>>                  interrupts = <31 0 0>, ...;
>>                  interrupt-names = "kick", ...;
>>                  ...
>>          },
>>
>> Then driver would request the IRQ during probe:
>>
>>          data->kick_irq = of_irq_get_byname(dev, "kick");
>>          if (data->kick_irq < 0)
>>                  ...
>>
>>
>> And later the driver would use the IRQ to kick the PRU:
>>
>>          irq_set_irqchip_state(data->kick_irq, IRQCHIP_STATE_PENDING, true);
>>
>>
> 
> We could but I am not sure if this kind of complex example should land
> in the commit log.
> Marc could you please comment how you want to see this?
> 
> Thank you,
> Grzegorz
> 

Based on the discussion in the device tree binding patch, the expanded
example I gave is incorrect, so we can just drop it.
