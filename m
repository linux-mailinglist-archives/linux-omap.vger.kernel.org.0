Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C19C1E0953
	for <lists+linux-omap@lfdr.de>; Mon, 25 May 2020 10:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388773AbgEYItV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 May 2020 04:49:21 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:50680 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388182AbgEYItU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 25 May 2020 04:49:20 -0400
Received: by ajax-webmail-mail-app4 (Coremail) ; Mon, 25 May 2020 16:48:47
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.77.158]
Date:   Mon, 25 May 2020 16:48:47 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Peter Ujfalusi" <peter.ujfalusi@ti.com>
Cc:     kjlu@umn.edu, "Jarkko Nikula" <jarkko.nikula@bitmer.com>,
        "Liam Girdwood" <lgirdwood@gmail.com>,
        "Mark Brown" <broonie@kernel.org>,
        "Jaroslav Kysela" <perex@perex.cz>,
        "Takashi Iwai" <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] ASoC: ti: Fix runtime PM imbalance in
 omap2_mcbsp_set_clks_src
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <16f653b3-2a36-7b2c-60be-73d550e47774@ti.com>
References: <20200525072209.6935-1-dinghao.liu@zju.edu.cn>
 <16f653b3-2a36-7b2c-60be-73d550e47774@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <46a95b71.c7abd.1724b0524b8.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgDn7wdvhster6sEAA--.1278W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgEJBlZdtORShQA2s2
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbtIS07vEb7Iv0x
        C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wCS07vE84ACjcxK6I8E87Iv67AKxVW0oV
        Cq3wCS07vE84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DMIAIbVAS0I0E0xvYzxvE52x0
        82IY62kv0487MIAIbVAqx4xG64xvF2IEw4CE5I8CrVC2j2WlV2xY6cIj6xIIjxv20xvE14
        v26r1j6r18MIAIbVAv7VC2z280aVAFwI0_Jr0_Gr1lV2xY6cvjeVCFs4IE7xkEbVWUJVW8
        JwCS07vEFIxGxcIEc7CjxVA2Y2ka0xkIwI1lV2xY6x02cVAKzwCS07vEc2xSY4AK67AK6r
        43MIAIbVCY0x0Ix7I2Y4AK64vIr41lV2xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS
        07vE4x8a6x804xWlV2xY6xC20s026xCaFVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14
        v26r1j6r18MIAIbVC20s026x8GjcxK67AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWU
        tVW8ZwCS07vEIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I
        0E14v26r1j6r4UMIAIbVCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lV2xY6IIF0xvE
        x4A2jsIE14v26r1j6r4UMIAIbVCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
        evJa73U
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Cj4gCj4gCj4gT24gMjUvMDUvMjAyMCAxMC4yMiwgRGluZ2hhbyBMaXUgd3JvdGU6Cj4gPiBXaGVu
IGNsa19zZXRfcGFyZW50KCkgcmV0dXJucyBhbiBlcnJvciBjb2RlLCBhIHBhaXJpbmcKPiA+IHJ1
bnRpbWUgUE0gdXNhZ2UgY291bnRlciBpbmNyZW1lbnQgaXMgbmVlZGVkIHRvIGtlZXAgdGhlCj4g
PiBjb3VudGVyIGJhbGFuY2VkLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBEaW5naGFvIExpdSA8
ZGluZ2hhby5saXVAemp1LmVkdS5jbj4KPiA+IC0tLQo+ID4gIHNvdW5kL3NvYy90aS9vbWFwLW1j
YnNwLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90aS9vbWFwLW1jYnNwLmMgYi9zb3VuZC9zb2MvdGkvb21h
cC1tY2JzcC5jCj4gPiBpbmRleCAzZDQxY2EyMjM4ZDQuLjg0YjRkZTliNjcwYyAxMDA2NDQKPiA+
IC0tLSBhL3NvdW5kL3NvYy90aS9vbWFwLW1jYnNwLmMKPiA+ICsrKyBiL3NvdW5kL3NvYy90aS9v
bWFwLW1jYnNwLmMKPiA+IEBAIC04MCw2ICs4MCw3IEBAIHN0YXRpYyBpbnQgb21hcDJfbWNic3Bf
c2V0X2Nsa3Nfc3JjKHN0cnVjdCBvbWFwX21jYnNwICptY2JzcCwgdTggZmNrX3NyY19pZCkKPiA+
ICAJaWYgKHIpIHsKPiA+ICAJCWRldl9lcnIobWNic3AtPmRldiwgIkNMS1M6IGNvdWxkIG5vdCBj
bGtfc2V0X3BhcmVudCgpIHRvICVzXG4iLAo+ID4gIAkJCXNyYyk7Cj4gPiArCQlwbV9ydW50aW1l
X2dldF9zeW5jKG1jYnNwLT5kZXYpOwo+IAo+ID4gIAkJY2xrX3B1dChmY2tfc3JjKTsKPiA+ICAJ
CXJldHVybiByOwo+ID4gIAl9Cj4gCj4gSSB0aGluayBpdCB3b3VsZCBiZSBjbGVhbmVyIGluIHRo
aXMgd2F5Ogo+IAo+IHBtX3J1bnRpbWVfcHV0X3N5bmMobWNic3AtPmRldik7Cj4gCj4gciA9IGNs
a19zZXRfcGFyZW50KG1jYnNwLT5mY2xrLCBmY2tfc3JjKTsKPiBpZiAocikKPiAJZGV2X2Vyciht
Y2JzcC0+ZGV2LCAiQ0xLUzogY291bGQgbm90IGNsa19zZXRfcGFyZW50KCkgdG8gJXNcbiIsCj4g
CQlzcmMpOwo+IAo+IHBtX3J1bnRpbWVfZ2V0X3N5bmMobWNic3AtPmRldik7Cj4gY2xrX3B1dChm
Y2tfc3JjKTsKPiAKPiByZXR1cm4gcjsKPiAKPiAtIFDDqXRlcgo+IAo+IFRleGFzIEluc3RydW1l
bnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgo+IFktdHVu
bnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtp
CgpUaGFuayB5b3UgZm9yIHlvdXIgYWR2aWNlISBUaGlzIGlzIGJldHRlciBhbmQgSSB3aWxsIGZp
eCB0aGlzCmluIHRoZSBuZXh0IHZlcnNpb24gb2YgcGF0Y2guCgpSZWdhcmRzLApEaW5naGFv
