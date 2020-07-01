Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1492107CB
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jul 2020 11:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgGAJPM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jul 2020 05:15:12 -0400
Received: from mout.web.de ([212.227.17.12]:53451 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725915AbgGAJPM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 1 Jul 2020 05:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1593594900;
        bh=gBtyVQm8fm2su1FSsiG7tja1aFYHtMY3thDKxgiNcpY=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=fRzBk9x8hcHUYzzPqnHbdwF894OrbOMrVFfRC69jTmu7WdOyTi6GmU5s7bwtMsrxI
         TjHvFd91eayF6IkkAZ536GsUDKJtcFd0rTyHZrDLsVUbgGgw17BACeOXa9RFOEWZDF
         zAiLCorNIgo57mBJxT0pc6k126M0xyYkw1aMPaY8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.41.17]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lcxxc-1j8jhc1EEC-00i8XE; Wed, 01
 Jul 2020 11:15:00 +0200
Subject: Re: [PATCH v4 11/14] irqchip/omap-intc: Fix potential resource leak
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <1593569786-11500-1-git-send-email-yangtiezhu@loongson.cn>
 <1593569786-11500-12-git-send-email-yangtiezhu@loongson.cn>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <fdbd6e18-37d4-cf29-a990-89c1974491cb@web.de>
Date:   Wed, 1 Jul 2020 11:14:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593569786-11500-12-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PksGMMULrlfc4sy8f/xMCXiwy7Wxo5ApqOVnjNfeRLx9xmwaZUt
 fwZneUWs/sMuRhHuolE27gU2PkeqwIvCEFobJlNuYX15D2aIM3D1SDYBZZ7Ps5BL7CmR3Hp
 wuMTL/RkjHGznDZ296rDyamA3BJw/hXpfLOJ5KrITAEojab6r+rrjLylywNxZvGgupvijDH
 hDT36j1MCFDULTn/RjAtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q9HnAGRZstE=:cCCO9QVn3fYCdFzkh8SeS4
 G4ec8kcqGJIH2hx/ySrpcE3aXIwAT4333eAHMhKbwwoHbNQptO6Bdtn6GLlk2iAqH1DTRo3aM
 6LNcmNSK5zO/rq84j12TZ50ph6dNiy9H4EUHhgwBK+sltB/T7uOD9NAhacXtjoW556Xgw7y1B
 HeMh57znOHRKCqjuFvXN4v1xrf6TRQ53tgobIYMG4yQMZ7IYKf8IwMWFi9502IB2zKVlPvMws
 Pl8H3ZrPm+7wSlBxVwzkSXkbvCsojbmjCfjOIQPKkD1Gy95E/KKL65WHjp+3n70UuO56Ns+o4
 bXg4dXGte+zBNzoaEEcnxWwDDgqc0JqrQ1Fg96qg53G392ftsyagi98yndKEG8wD5pbkSjLpd
 XLXDZNqyXSKRHsDsAg1Fc5Zqz2tGStinIGQ4ytq1A06S7Kkzlc82XcP7l2qqHzZQAK+GQxUV9
 1lW2HjiQ/2yqjSdSbc36Vwz0ShgoNCS+VkpmhmkzV4xFqc26hDd9/fK+HXlkUh/Bq4CNdqYSO
 FVC0XH6xvekLodhEw5GauDXTl6leWG3d+sHveHIj7uBN7uOrLILV1OnLhe/1qCPESwDHDQfL/
 PhymbiJBriRyfQdYVXhdU5lcJpSY1uSqwnwlGzZy+r1ArO0ankKFKrsUXkzZZcv1l8yARhIpN
 OBWfAXBYJL0wgFwg7YNRoVokZuA5NvVwwsiMtwZsCvkCHqFuxk4jKyPIeDfrm/EzIbeoU7OlO
 6vswqYUYfe4aiN/GJftTHSxyhoIBZb/PLUzxfqzAKopWs02bRPUhswF5Ig9IrvAiXVY/MSdui
 WVf4UlCFlhhOsWqOxH1GXwTTb1ORTHOHYfTQIrZ4qhKCD5cu5VxIkxZCca3D4oWhS0NIhx3oJ
 ofnTMX2XnT230dvOR9x6I/Q6LlNIURzNfozmlCdXcAqTEsbTcxCX3tvWgb5wU6tlXmkE2isuS
 1CJcyNHSGTmV66yzEZ9FBTpK+Q6sJ5+u81Nfy/EgqLa+ziPzE6uIArxhB4Av1jW6fJdMuX+/2
 bhVbmlvbKaiFkvhZyECFEQWgs2Ay9sDgi6R8m05QW0VZhvgwd62Ccsmfh3yZxf9wpohwOOQF+
 m8ET7+2ZSCssVHl9TLym1PiX3Zf9j371okrez04a08Ywd9MQaoyUMuMsyrPYpGHqzsJ4HdFgR
 gjy8uCGeSG6qkjXbqiSZB+/jZiqtnAFL0KFTL9pBzdKhWtfeQdCyCBuSL8+KAGqK+n0VldEI3
 Yz0GAqGZuv5OKQ8M2
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

> In the function omap_init_irq_of(), system resource "omap_irq_base"
> was not released in the error case, fix it.

Another small wording adjustment:
  =E2=80=A6 in an error case. Thus add a call of the function =E2=80=9Ciou=
nmap=E2=80=9D
  in the if branch.

Regards,
Markus
