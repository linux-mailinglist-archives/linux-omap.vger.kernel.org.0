Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 976F01B913
	for <lists+linux-omap@lfdr.de>; Mon, 13 May 2019 16:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730941AbfEMOvL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 May 2019 10:51:11 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.117]:52535 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727870AbfEMOvK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 May 2019 10:51:10 -0400
Received: from [85.158.142.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-6.bemta.az-b.eu-central-1.aws.symcld.net id 99/A7-19007-A5489DC5; Mon, 13 May 2019 14:51:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGKsWRWlGSWpSXmKPExsViZ8MxRTeq5Wa
  MwZuNchazl/SzWOy/4uXA5PHt6yQWj8+b5AKYolgz85LyKxJYMzY+O81ScMaqoueGXwPjP/Mu
  Rk4OIYFWJonFd6W6GLmA7GOMEj9PPmeHcC4ySmxoOs8GUsUm4C6x9d59JhBbREBT4lLzNrA4s
  4CtxP1Ld1i6GDk4hAV8JS61a0KU+EmsaJ/DAmFbSbzvmglWziKgKvH1/18wm1fAW6Lp0B52iC
  MKJV59vc0IYnMKGEhsndwMFmcUUJHYdXcLI8QqcYlbT+aDnSAhICLx8OJpNghbVOLl43+sILa
  ogLzE0wt32SHiOhJnrz9hhLCBZi7dxwJhK0hc3budBWJmlcTEXQ1Q9whKnJz5hGUCo/gsJOtm
  ISmbhaQMIq4p0br9NzuErS2xbOFr5lnQUNl/dSWUbSrx+uhHRghbUWJK90P2BYwcqxgtk4oy0
  zNKchMzc3QNDQx0DQ2NdU11DU3N9BKrdJP0Ukt1k1PzSooSgbJ6ieXFesWVuck5KXp5qSWbGI
  HxnlLIOmcH4+6u9EOMkhxMSqK8j/tuxAjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4FVpvhkjJFi
  Ump5akZaZA0w8MGkJDh4lEV5FkDRvcUFibnFmOkTqFKMlx4FFD+cycxz8DiKPTHw2l1mIJS8/
  L1VKnHdyE1CDAEhDRmke3DhYcrzEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3QSPQFJ7Mv
  BK4ra+ADmICOiig+BrIQSWJCCmpBsYHyhwnr9RPuKN9RugtZ3zS5olOHd13bsmfudigE3Eo1T
  KQf3VdQq+Ci5Bc1FLZpoCJjswb5jacPPH68LqeSL6P+e36Xw4LN+Uk39aeuv7zkxCO85P/1zn
  H+ch/mKF23Cuq1+q5pevqfSuKzI3+xiRKvriw757N+yDNxgnP5j338LG4PMc8PkGJpTgj0VCL
  uag4EQCTSMjjiQMAAA==
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-25.tower-238.messagelabs.com!1557759066!5416039!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29341 invoked from network); 13 May 2019 14:51:06 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-25.tower-238.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 May 2019 14:51:06 -0000
Received: from R01UKEXCASM121.r01.fujitsu.local (ex2k13_121.fs.fujitsu.com [10.183.43.173])
        by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id x4DEowsn003476
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
        Mon, 13 May 2019 15:50:58 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 13 May 2019 15:50:58 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c])
 by R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c%22]) with
 mapi id 15.00.1395.000; Mon, 13 May 2019 15:50:58 +0100
From:   "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
To:     "tony@atomide.com" <tony@atomide.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: Kernel Oops when something is executed from within the initramfs
Thread-Topic: Kernel Oops when something is executed from within the initramfs
Thread-Index: AQHVBw9UinRRwm1BC0G6WBfKA16jQ6ZkYbWAgAS19IA=
Date:   Mon, 13 May 2019 14:50:57 +0000
Message-ID: <e22ceb01c9f2d9136e44475962d570af0d489d7a.camel@ts.fujitsu.com>
References: <50042d920efa281582ed8b5486ea89456ad4de65.camel@ts.fujitsu.com>
         <20190510145441.GU8007@atomide.com>
In-Reply-To: <20190510145441.GU8007@atomide.com>
Accept-Language: de-DE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.32.1-2 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.183.43.93]
Content-Type: multipart/signed; micalg=sha-1;
        protocol="application/x-pkcs7-signature"; boundary="=-+jEAcktdJ0gUfzPCyz/f"
MIME-Version: 1.0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--=-+jEAcktdJ0gUfzPCyz/f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tony,

thanks for your answer. Sadly it's not an overlapping issue.
I even printed the first four and the last four bytes of the initramfs befo=
re the kernel decompresses it,
so I can be sure. And the bytes fit the bytes of my initramfs.

Any other hint why I can't execute anything from within the initramfs?

Cheers,
Thilo

Am Freitag, den 10.05.2019, 07:54 -0700 schrieb Tony Lindgren:
> Hi,
>=20
> * thilo.cestonaro@ts.fujitsu.com <thilo.cestonaro@ts.fujitsu.com> [190510=
 09:04]:
> > Hi all!
> >=20
> > I try to update our kernel of our AM335x based board to a newer version=
 (4.4.179).
> > The new kernel builds and boots, but as soon as something from within t=
he initramfs is executed,
> > a kernel Oops occurs, e.g. modprobe (davinci_mdio requests a module) an=
d /init can't be executed.
> >=20
> > The problem is, that I've no clue what's going wrong.
>=20
> It could be kernel uncompress or dtb and initramfs overlap issue.
> You could try booting by manually setting u-boot prompt:
>=20
> setenv fdtaddr 80a00000
> setenv loadaddr 80c00000
> setenv rdaddr 81600000
> setenv fdt_high 8c000000
> setenv initrd_high ffffffff
>=20
> And see if that helps. It might be worth checking the current
> values used by u-boot, the above values may not be optimal.
>=20
> Regards,
>=20
> Tony

--=-+jEAcktdJ0gUfzPCyz/f
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIO4TCCBNcw
ggO/oAMCAQICCiSNEwIAAQACcUMwDQYJKoZIhvcNAQEFBQAwLzEtMCsGA1UEAxMkRnVqaXRzdSBU
ZWNobm9sb2d5IFNvbHV0aW9ucyBVc2VyIENBMB4XDTE5MDMxMTE1NTA0NFoXDTIyMDMxMDE1NTA0
NFowQjEZMBcGA1UEAwwQQ2VzdG9uYXJvLCBUaGlsbzElMCMGA1UECgwcRnVqaXRzdSBUZWNobm9s
b2d5IFNvbHV0aW9uczCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAxBawqv3l1UYzPh200CPw
+C4Lmr9INkgOXxSSb9jckQIydjq1EI0hDTtuCGrnegSQUE/UyH1tF68Rg8k5jFN3WGP3Nq3FYccI
Vithm3lVhmrJwmRYmHsApNDzbO397qosCadiCqbLEnqTo9E6iNKhWXlwL4vx6ic57PLvZqjEjsMC
AwEAAaOCAmQwggJgMAsGA1UdDwQEAwIFoDCBvgYDVR0RBIG2MIGzgR50aGlsby5jZXN0b25hcm9A
dHMuZnVqaXRzdS5jb22BI1RoaWxvLkNlc3RvbmFyb0BmdWppdHN1LXNpZW1lbnMuY29tgR50aGls
by5jZXN0b25hcm9AY2VtYWlsLmZzYy5uZXSBKHRoaWxvLmNlc3RvbmFyb0BlbWVpYWNlbWVhLmZ1
aml0c3UubG9jYWyBIis0OTgyMTgwNDgyMzI4QGluY29taW5nZmF4LmZzYy5uZXQwHQYDVR0OBBYE
FG82zUiLm89hH0nCcAY02RuS+4YNMB8GA1UdIwQYMBaAFEGdEN1Eu4l2olKE8qRXJC3ePoHzMD8G
A1UdHwQ4MDYwNKAyoDCGLmh0dHA6Ly9jZHAudHMuZnVqaXRzdS5jb20vY2RwL2Z0czAxdXNlcigx
KS5jcmwwSgYIKwYBBQUHAQEEPjA8MDoGCCsGAQUFBzAChi5odHRwOi8vYWlhLnRzLmZ1aml0c3Uu
Y29tL2FpYS9mdHMwMXVzZXIoMSkuY2VyMAwGA1UdEwEB/wQCMAAwPQYJKwYBBAGCNxUHBDAwLgYm
KwYBBAGCNxUIhYXEMoGH/2GBhYEEhuyCIIHHgRp5g4igcYfS8S8CAWQCAQgwEwYDVR0lBAwwCgYI
KwYBBQUHAwQwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDBEBgkqhkiG9w0BCQ8ENzA1MA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAIAwBwYFKw4DAgcwCgYIKoZIhvcNAwcwDQYJKoZI
hvcNAQEFBQADggEBALKreuSS9+wfZ0H6ozKl2itg44C8UqbqOkPLuxDtIPTgolN8eba85vNGtsIE
yY7pUmZMwnxSXrqBCSxrHPGrnMiuJyC2/cZdq6JibG5qlDD70P2aMJdxxK7YjuMV9cC9j+ugX+QP
L1WM9k3j6S+EG4xRRcVO/9GgCv2C7rmHRLZg4UUq8JcCiRcbztK5Bi4nWKomVumrHxiLhyL9UUgF
/5irHdJPnDZykdI9qJPmCf4nw3415TjQxdBMt5RkRfw6d/Z0eyE5KrkgPoJOVcbW38FBREU6F0KP
p36JbC6//v24aBxk2b4Rywp1bOhNhw158Epsjt3HU4oYAF8duTf52+EwggTXMIIDv6ADAgECAgok
jRMCAAEAAnFDMA0GCSqGSIb3DQEBBQUAMC8xLTArBgNVBAMTJEZ1aml0c3UgVGVjaG5vbG9neSBT
b2x1dGlvbnMgVXNlciBDQTAeFw0xOTAzMTExNTUwNDRaFw0yMjAzMTAxNTUwNDRaMEIxGTAXBgNV
BAMMEENlc3RvbmFybywgVGhpbG8xJTAjBgNVBAoMHEZ1aml0c3UgVGVjaG5vbG9neSBTb2x1dGlv
bnMwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMQWsKr95dVGMz4dtNAj8PguC5q/SDZIDl8U
km/Y3JECMnY6tRCNIQ07bghq53oEkFBP1Mh9bRevEYPJOYxTd1hj9zatxWHHCFYrYZt5VYZqycJk
WJh7AKTQ82zt/e6qLAmnYgqmyxJ6k6PROojSoVl5cC+L8eonOezy72aoxI7DAgMBAAGjggJkMIIC
YDALBgNVHQ8EBAMCBaAwgb4GA1UdEQSBtjCBs4EedGhpbG8uY2VzdG9uYXJvQHRzLmZ1aml0c3Uu
Y29tgSNUaGlsby5DZXN0b25hcm9AZnVqaXRzdS1zaWVtZW5zLmNvbYEedGhpbG8uY2VzdG9uYXJv
QGNlbWFpbC5mc2MubmV0gSh0aGlsby5jZXN0b25hcm9AZW1laWFjZW1lYS5mdWppdHN1LmxvY2Fs
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
myqEotbvCYz668c+27UAAAAAAAA=


--=-+jEAcktdJ0gUfzPCyz/f--
