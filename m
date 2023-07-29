Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD0D767F62
	for <lists+linux-omap@lfdr.de>; Sat, 29 Jul 2023 15:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjG2NNL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 29 Jul 2023 09:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjG2NNK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 29 Jul 2023 09:13:10 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4CB11B;
        Sat, 29 Jul 2023 06:13:09 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id BADF221878;
        Sat, 29 Jul 2023 13:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1690636387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BupZXU3IW8P+SnBAGGFf+kI+oqjzxF/E0y1UOjv/kjs=;
        b=hI5kUgbLp7nD20D6aZCwRi3sSrt7tROp6a9YlFO9OS7nGVzgLOFDdznxwyVu4vfViNrEc0
        uimGGjQaJPlDTWm9yBVsvpGnVDtU1hYTuA1bwt2aMvGEfS99gkC8l8y+WBUFg5Ux1twc3x
        YdgBlZ8LHmcaNjAXh0ZqCDX1bFz6XWU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1690636387;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BupZXU3IW8P+SnBAGGFf+kI+oqjzxF/E0y1UOjv/kjs=;
        b=ijRyKAws175c9E4a7ovxJgXh6HGbzalzF7Xteygi+m6mIlaEOWMskllM9wK7JbCikE1vqc
        5N5s4Jo3jBI2DZDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7FD4713922;
        Sat, 29 Jul 2023 13:13:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id mmghHmMQxWSVFgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Sat, 29 Jul 2023 13:13:07 +0000
Message-ID: <72a1e736-c16f-8cf1-1e2a-cad6800b265d@suse.de>
Date:   Sat, 29 Jul 2023 15:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/47] fbdev: Use I/O helpers
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     deller@gmx.de, javierm@redhat.com, linux-media@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-geode@lists.infradead.org, linux-omap@vger.kernel.org,
        kvm@vger.kernel.org
References: <20230728182234.10680-1-tzimmermann@suse.de>
 <20230728183906.GB1144760@ravnborg.org>
Content-Language: en-US
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230728183906.GB1144760@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0OdH83si0AMSV6RWag4NGXuJ"
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0OdH83si0AMSV6RWag4NGXuJ
Content-Type: multipart/mixed; boundary="------------SGTmCYniiMc0h5SrbMJlX5yG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: deller@gmx.de, javierm@redhat.com, linux-media@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-geode@lists.infradead.org,
 linux-omap@vger.kernel.org, kvm@vger.kernel.org
Message-ID: <72a1e736-c16f-8cf1-1e2a-cad6800b265d@suse.de>
Subject: Re: [PATCH 00/47] fbdev: Use I/O helpers
References: <20230728182234.10680-1-tzimmermann@suse.de>
 <20230728183906.GB1144760@ravnborg.org>
In-Reply-To: <20230728183906.GB1144760@ravnborg.org>

--------------SGTmCYniiMc0h5SrbMJlX5yG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDI4LjA3LjIzIHVtIDIwOjM5IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBGcmksIEp1bCAyOCwgMjAyMyBhdCAwNjozOTo0M1BN
ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IE1vc3QgZmJkZXYgZHJpdmVy
cyBvcGVyYXRlIG9uIEkvTyBtZW1vcnkuIEFuZCBtb3N0IG9mIHRob3NlIHVzZSB0aGUNCj4+
IGRlZmF1bHQgaW1wbGVtZW50YXRpb25zIGZvciBmaWxlIEkvTyBhbmQgY29uc29sZSBkcmF3
aW5nLiBDb252ZXJ0IGFsbA0KPj4gdGhlc2UgbG93LWhhbmdpbmcgZnJ1aXRzIHRvIHRoZSBm
Yl9vcHMgaW5pdGlhbGl6ZXIgbWFjcm8gYW5kIEtjb25maWcNCj4+IHRva2VuIGZvciBmYmRl
diBJL08gaGVscGVycy4NCj4+DQo+PiBUaGUgZmJkZXYgSS9PIGhlbHBlcnMgYXJlIGVhc2ls
eSBncmVwLWFibGUuIEluIGEgbGF0ZXIgcGF0Y2gsIHRoZXkgY2FuDQo+PiBiZSBsZWZ0IHRv
IGVtcHR5IHZhbHVlcyBpZiB0aGUgcnNwLiBmdW50aW9uYWxpdHksIHN1Y2ggYXMgZmlsZSBJ
L08gb3INCj4+IGNvbnNvbGUsIGhhcyBiZWVuIGRpc2FibGVkLg0KPiANCj4gRGlkIHlvdSBt
aXNzIHNtNzUwIG9yIHdhcyBpdCBsZWZ0IG91dCBvbiBwdXJwb3NlPw0KDQpJIGRpZCBtaXNz
IGl0IGluZGVlZC4gSSdsbCBhZGQgdGhlIHBhdGNoIHRvIHRoZSBuZXh0IGl0ZXJhdGlvbi4g
VGhhbmtzIA0KZm9yIG5vdGljaW5nLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IEFz
IGl0IGhpZGUgaW4gc3RhZ2luZyBpdCBpcyBlYXN5IHRvIG1pc3MuDQo+IA0KPiAJU2FtDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2
LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVy
cywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVl
cm5iZXJnKQ0K

--------------SGTmCYniiMc0h5SrbMJlX5yG--

--------------0OdH83si0AMSV6RWag4NGXuJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTFEGIFAwAAAAAACgkQlh/E3EQov+D/
Tg//TWBMftmmzj4m1rg2kR2H8m5uMQaAjKIusCjr/I/nFx2LsbnqA3YhdStMqeZqdFFbS5Rhr7ZT
5fJAxsgt0pkK/cYTuvvii0LLkqUFSLSYQduWBMG0HpgtrPFbSQrzRofiBxIMmi5NWYHn9vcDZk3t
7OaW9CrBEm1N9JubnW7c1l/Hv2kMsSLDr3S85nS2NMtzICHHMUOA+6kuaocHKL9S8ccag2mwH6sJ
wgpRQNrVbdQkNEolXfqOOyIC4Z6gzMBHQm6L2tA+QeXGYN0WOYoI5UNZY/aKaoZT9g7DicYYSLbd
ptLRO8uJSm3ZINHzIIfhU1nbqNiiThDNobOTEACuw0GNer+JtlBkVqvg39rIRD8It3umD3uc1hdd
YZZrJIDCxXmCPbY3ayEnaCqnpGafrWAQmWd7ccoYzt6qPgsepVt/FyNyEWR1DueR6u0TqqdNIeCM
P5v7vJrjTdtNBnnu0ua/E9aVZ7xbl5X+xFKNL8GHrxaRP9mLoAys3pvougaLLHkIOdu+A2//GRMc
Mc6lIi8RdFVHxH7HeFBXMBUiHqIDgwe3XzSuj0tIe7NJr48IR1rkruoPgHveY+3MG/knk3iUTKU7
UuZyplZPY8pc+AhturPUYW9ETQBa6xYKGrYq3wnWw97D2dXBe80DFPkeXAwVqJUHyvtMSI7Lcbaf
9pg=
=IZjd
-----END PGP SIGNATURE-----

--------------0OdH83si0AMSV6RWag4NGXuJ--
