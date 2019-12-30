Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1BE112D478
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 21:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbfL3U2V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 15:28:21 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:28941 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727695AbfL3U2V (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Dec 2019 15:28:21 -0500
X-Greylist: delayed 417 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Dec 2019 15:28:19 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1577737698;
        s=strato-dkim-0002; d=dawncrow.de;
        h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=v/8MrpIUFBPW/f+lA2CtHfFaaqBCeq3F8gQxYbULoDY=;
        b=q51U9gvtM1fPBStGUpvu5C94v+azCtDXqSEahobNODkHuRAfXLi/4J5mEqxBjn+Qlk
        xyJEEYw/2HJA4DaENJKOB0lzOQENqkgEhBl7eBfnFNVJVDX4tEhJ1X9RF1iHNvXq8C7p
        DN5W5RfF5yhaoul6GW9JADyjQbutsgyNhf9KoGAHkZ/wEdzW/Gayndevm4BKwkGNHoLE
        XaqkhqwunQ+SriwWiNx5+kZxXD2hkY+HxMwKVfE/W+VG5GAaKGFGPzDpRi0WHeqxtLBu
        TVGsYur41UstgPTYMWt+1lsMU3/+cAqih/j3sfBTRWcFNdcXKSB3g5NlC0ZRy5tNn5Mh
        sXJQ==
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZ6bi4rK0b8tGDimOzIxQbIOZSqtgWHzDs8="
X-RZG-CLASS-ID: mo00
Received: from [192.168.178.40]
        by smtp.strato.de (RZmta 46.1.3 DYNA|AUTH)
        with ESMTPSA id I099d1vBUKMGG84
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 30 Dec 2019 21:22:16 +0100 (CET)
Subject: Re: [PATCH] ARM: dts: Add omap3-echo
To:     Tony Lindgren <tony@atomide.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Adam Ford <aford173@gmail.com>, linux@arm.linux.org.uk,
        robh+dt@kernel.org, mark.rutland@arm.com, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191224161005.28083-1-nerv@dawncrow.de>
 <20191224184503.GK35479@atomide.com>
 <60412339-53BF-4DC1-8AF6-4FB0E75D429C@goldelico.com>
 <53e6cbbd-1094-cba2-4942-981502a738d4@dawncrow.de>
 <20191230172948.GL35479@atomide.com>
From:   =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Autocrypt: addr=nerv@dawncrow.de; prefer-encrypt=mutual; keydata=
 xsDNBFN7n6MBDAC0neZ/lrjWZzrvVeO7bc70o4xze8gj5q1mb9Zr0ilxXWyo2hm5oZWt8Wf/
 oCrDQmR49Be2VZMbruYp3YK+GmbYxi6R+nkEb+KZ7OAaHx6VcCpdtb3iEMfjsJCO6vD3phS9
 C9JS++C3dKxallSdJrhYvU6eMJITW21eRZ112d12zNeCODGpMJ5Cwm0TQhQwI9dK7wPUPGNj
 GeuTqQp0cuIQswHCK0zy5Y6Xm8P7i7Au+cWEuiZuZ7iiTT9ycklUmuA/owWZRkd39DgwxfDh
 PV7vrAD9jNH8Kl5T8m54KQhgg+A+OiBZ/ugEWJeWwqJjs6RBIoECXO4GtNhQiD827PigeEm3
 YE5iIjGygJE/1PPO3vmrVYrwn7fGTZJUFn97k4TROijNqj6fr2DLLEbW3Oj+B8vcxlxZGqze
 yU3qQUHCpukxVCwlFUEKI1OOvraB5rQRDRS/y28tI5IkKTycX9bjBq5FCEhLO9ErewRJsXyZ
 ff68fqX8CPUxGFUSGPPgmj8AEQEAAc0jQW5kcsOpIEhlbnRzY2hlbCA8bmVydkBkYXduY3Jv
 dy5kZT7CwPgEEwECACIFAlN7n6MCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEGm5
 GZTakYsskf8L/iFSlooD4kELDwXTRglHDxtzrgdN3kEjLd9RcW/AI1/HFlQlk5vk+0Ys1LZK
 2kdBmm51qI6SbVG08wUZk4y/yLHlV2QbhfDcR5YfobHhB0XlJGMJ4vQw/GxVLlTa6CjP4aOb
 jpRCdhW2X3eRnmBsjCJ3TJLa9YWgmjH7PcVkXc84uSntQl17pmnbmLkBS9xa63Vt5YYe9G5i
 mT2qZn+2IH3Jcu8gYTURR5j6PuBrmjWc7M2pEY3LXHYpTEIS96Y4ZOan7LhAYTgBFEU7Mt2m
 BZX+BssyGKl4TKXwq6bHDg2tIJ8NzZ5ScERQjauUR+Dw11wxFc2KJFtrF2cnkdwVp9YWkGwJ
 iLbRTlfxjit/af3WO2c8DZsF+IyWVs/GzhMPYQ/Tdy2Z6xAj8hmtYeKO5erUNgeiNWh3keHq
 JQgfnVTgwNOHBTDC38/0B+FcgLDKiBtNrk4pqBsQEG2ab+ca3a/x6AIGX0KKuyJKv8toNXxO
 IsaDmTF1DbykjI1sQ98KQc7AzQRTe5+jAQwAz7GXGpdsZp1rU4cf87mDejTqxcSzVdw8KTQg
 4baCC7sHY7QbJ+vhCminxVaWqxy1HuMGD/njDFB4h+ke2nfghjPRvfpOuDG/MRGmwchEuIQt
 wbpHVmimNL3ewxWaUpcjF/QAYhfXumGUefU1rLzmLlYvZoVUsoTemPFjB2wvJRW/PdKmN1nh
 pihT+AMIfyI4W0rcRFRSNgoACbj5PC7Fw3jNewVK7DreLvvVFdANA7NppT8dkuwj5MMpX/2b
 fLznagJMp++cXPTg9eSnUHL0ACIsUfcajuTG2KGeKJi84H5usKfzKK7IXvIsEvqqbSCA4ocZ
 Q55nrlmVsyfgmWUIuYA791a3exFEiDpeTRiDyP0bQUdkp7grwMFFFK09peU/EjgYGqAqEoxq
 fgkihY57PqDlbL9cZeZ3nns1PLwiyf9ZhcrDffe0Otm/Jad07UIz/GFr9bgMSi+ugNyQlEko
 ZQgLq0PxbL5GwK9XP5iBW90/nIW+Dkve7jZmfvm6AShHABEBAAHCwN8EGAECAAkFAlN7n6MC
 GwwACgkQabkZlNqRiyxzOAwAq9KfzyGLvcHStmVVqqLOx2DWEYL+erNcn2e3DdFhempLfH05
 sUKx6SbgPn+EgQCkKCM81juW9vpJdKhERG6Bc627d5nCMH8BNp4v8SzeKY04uodjLe2V2uX1
 KY7kn8llWbMdwJP50w71KP4lI841Kba0fHVy+nerPATgwGTyS02OwiM3XWUfOiLJtpPxt7u2
 IVXGVde+hhvra2bhnW22g0gzGAL4qwjJz7XIpjpwHlUO7y8DuczaQd6rrCwMYwrbnKFxoLHU
 Ao05Mi5DD9JRT2Hi7Z85ZNW8fxR2wumzsTFTQNgdGEmUTcJQsMVQQ77syk/C3ViL+I617MuU
 Wc89hbJwEvglcs1BVQ8T+HGc2nOCvJCDDO7KZE3szTAkypU82TsK0UkJwdePyD3QGYfeARKg
 643Y1Si/C9Ir3JXrKHqA10I2U77hVDzDGC9EAm2qs4DDkQdWVmuIP7DWQNgOPWpvCQECEwcA
 BZtrxq8dmex7tFXvQoJV4PIa20fGXq6S
Message-ID: <56d6f5d9-1afb-9986-0c91-ba9b973f927e@dawncrow.de>
Date:   Mon, 30 Dec 2019 21:22:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191230172948.GL35479@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-LU
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Am 30.12.19 um 18:29 schrieb Tony Lindgren:
> * André Hentschel <nerv@dawncrow.de> [191227 14:29]:
>> For clarification this reduced table should help:
>>      DM3730 | DM3725 | AM3715 | AM3703
>> DSP    X    |   X    |        |    
>> SGX    X    |        |   X    |    
>>
>> Where X is "supported"
> 
> And let's also add minimal dm3725.dtsi, am3715.dtsi and am3703.dtsi
> to make things simple. The device tree is supposed to describe the
> hardware, and in most cases the SoC version is fixed and need no
> dynamic detection.
> 
> André, can you please add those three dtsi files since you have at
> least one test case? :)

Done, but I'm not sure how to handle the DSP stuff, so I only sent the SGX changes as I understood you want them to be
