Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFDA9347D9D
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 17:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234076AbhCXQY5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 12:24:57 -0400
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21123 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbhCXQYZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 Mar 2021 12:24:25 -0400
X-Greylist: delayed 907 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Mar 2021 12:24:24 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1616602141; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=Coj5qPoXRf4qDnwzRvgcy4Pe2N8O8gpF7A3DYaHs/JBRbjrqBfgcKQXodqKvpb8wx13qeftSi3/N8fHiAfD0ab3swMhK5+Mlr8543DRdouH/YZMgR3vkWbB77c/4pRANF/8ac5fYR/rSYSdTWv542AP6ZCGFVQiukd1tGI5LYPo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1616602141; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=O3Hvxfg/YcoGwihKU1Fyavd8RTA60HQcXRLfLmYZ4Cc=; 
        b=MYwD+zRViU3Knj+BrFximCiHH3t/EISNfjszp8LgGSsWVieVk7QeezvKcQILhG6G0P6ueoYgXzuSPIDUGmU2yllJdGZ4AHV6wbAS9W3gX1invudcrKhHL55Bnz2VMm414Pcp8B03m700n3v69KcZJ1zp6oK1uuqS7DMZ7TXffkg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=carl@uvos.xyz;
        dmarc=pass header.from=<carl@uvos.xyz> header.from=<carl@uvos.xyz>
Received: from [10.0.0.102] (ip-95-222-214-39.hsi15.unitymediagroup.de [95.222.214.39]) by mx.zoho.eu
        with SMTPS id 1616602140011723.3978037548596; Wed, 24 Mar 2021 17:09:00 +0100 (CET)
Date:   Wed, 24 Mar 2021 17:08:58 +0100
Subject: Re: [PATCH 2/5] ARM: dts: add battery phandle to cpcap_charger
From:   carl@uvos.xyz
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        linux-omap@vger.kernel.org
Message-ID: <17864ff0d6d.6fcdc75d-1677305881.-8147809712278605057@zoho.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


PiBJIHRoaW5rIHRoZSBwYXRjaCBpcyBhbHNvIHdyb25nLCBzaW5jZSB0aGUgaW5mb3JtYXRpb24g
aXMgYWxyZWFkeSAKPiBkZXNjcmliZWQgaW4gRFQgLSBqdXN0IHRoZSBvdGhlciB3YXkgYXJvdW5k
OiBUaGUgYmF0dGVyeSByZWZlcmVuY2VzIAo+IHRoZSBjaGFyZ2VyLiBUaGlzIHByb3ZpZGVzIGFs
bCByZXF1aXJlZCBpbmZvcm1hdGlvbiB0byB0aGUga2VybmVsIAo+IGZvciBhIDE6MSBsaW5rLiAK
Pgo+IC0tIFNlYmFzdGlhbiAKCkkgYWRkZWQgdGhpcyBzbyB0aGF0IGNwY2FwX2NoYXJnZXIgbWF5
IGJlY29tZSBhd2FyZSBvZiB0aGUgYmF0dGVyeSBpbnNlcnRpb24gc3RhdGUgYnkgcXVlcnlpbmcg
dGhlIGJhdHRlcnkgZHJpdmVyLgpXb3VsZCB5b3UgdGh1cyByZWNvbW1lbmQgdGhhdCBpbnN0ZWFk
IG9mIGFkZGluZyB0aGlzIHBoYW5kbGUgaSBzaG91bGQgYW1lbmQgdGhlIHNlcmllcyBzdWNoIHRo
YXQgY3BjYXBfY2hhcmdlciB3YWxrcyB0aGUgdHJlZSBsb29raW5nIGZvciBhIGNwY2FwX2JhdHRl
cnkgY29tcGF0aWJsZSBub2RlIGFuZCB0aGVuIGRldGVybWluZXMgaWYgdGhlIGNoYXJnZXIgcGhh
bmRsZSBwb2ludHMgdG8gaXRzZWxmPyBJcyB0aGVyZSBzb21lIHJlY29tbWVuZGVkIHdheSBwZXJm
b3JtaW5nIHRoaXMgcmV2ZXJzZSBzZWFyY2g/Cg==

