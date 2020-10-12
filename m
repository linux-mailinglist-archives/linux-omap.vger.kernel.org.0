Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FE928AC2D
	for <lists+linux-omap@lfdr.de>; Mon, 12 Oct 2020 04:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgJLCdM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 11 Oct 2020 22:33:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51520 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725882AbgJLCdM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 11 Oct 2020 22:33:12 -0400
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr97yv4NfkbEcAA--.4007S3;
        Mon, 12 Oct 2020 10:31:16 +0800 (CST)
Subject: Re: [PATCH v5 00/14] irqchip: Fix potential resource leaks
To:     Marc Zyngier <maz@kernel.org>
References: <1593998365-25910-1-git-send-email-yangtiezhu@loongson.cn>
 <ab1cd9280c7892a0230945ef5ff0880c@kernel.org>
 <02e077df-7c4e-24a7-1640-5f17894bd252@loongson.cn>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>,
        Guo Ren <guoren@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        David Lechner <david@lechnology.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Jisheng Zhang <jszhang@marvell.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Grant Likely <grant.likely@secretlab.ca>,
        u.kleine-koenig@pengutronix.de,
        Catalin Marinas <catalin.marinas@arm.com>,
        Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <anup.patel@wdc.com>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <rob.herring@calxeda.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
        linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <4b18d030-76c7-1b83-3b0d-deb8ecd925dc@loongson.cn>
Date:   Mon, 12 Oct 2020 10:31:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <02e077df-7c4e-24a7-1640-5f17894bd252@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxr97yv4NfkbEcAA--.4007S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW5Xw43tFyrCr4Duw47XFb_yoW8XF4DpF
        13t3WYkr4kX34qyFnFkw47Xa4Iy3yDK3yUWryYgrs3Aw1q9F1DWrWrtFyFkw4DWw1rGF42
        kws5t3s7Aw1jyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Eb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr
        0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY
        04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMx
        C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
        wI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
        IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
        x2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
        AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8aYLPUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 09/02/2020 11:59 AM, Tiezhu Yang wrote:
> On 07/06/2020 03:30 PM, Marc Zyngier wrote:
>> On 2020-07-06 02:19, Tiezhu Yang wrote:
>>> When I test the irqchip code of Loongson, I read the related code of 
>>> other
>>> chips in drivers/irqchip and I find some potential resource leaks in 
>>> the
>>> error path, I think it is better to fix them.
>>>
>>> v2:
>>>   - Split the first patch into a new patch series which
>>>     includes small patches and add "Fixes" tag
>>>   - Use "goto" label to handle error path in some patches
>>>
>>> v3:
>>>   - Add missed variable "ret" in the patch #5 and #13
>>>
>>> v4:
>>>   - Modify the commit message of each patch suggested by Markus Elfring
>>>   - Make "irq_domain_remove(root_domain)" under CONFIG_SMP in patch #3
>>>   - Add a return statement before goto label in patch #4
>>>
>>> v5:
>>>   - Modify the commit messages and do some code cleanups
>>
>> Please stop replying to Markus Elfring, and give people who actually
>> care a chance to review this code. Elfring will keep asking you to make
>> absolutely pointless changes until you are blue in the face
>
> Hi Marc,
>
> Any comments?
> Could you please apply this patch series?

Hi all,

Maybe I should cc the related persons through ./scripts/get_maintainer.pl
to get Acked-by or Reviewed-by.

The cover letter link of this patch series is:
[v5,00/14] irqchip: Fix potential resource leaks
https://lore.kernel.org/patchwork/cover/1268043/

Any comments will be much appreciated.

Thanks,
Tiezhu

>
> Thanks,
> Tiezhu
>
>>
>>
>> Thanks,
>>
>>         M.
>

