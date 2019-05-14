Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3E01CBB9
	for <lists+linux-omap@lfdr.de>; Tue, 14 May 2019 17:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfENPVA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 May 2019 11:21:00 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.1]:55344 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726025AbfENPVA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 14 May 2019 11:21:00 -0400
Received: from [85.158.142.101] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 06/E0-22995-7DCDADC5; Tue, 14 May 2019 15:20:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBKsWRWlGSWpSXmKPExsViZ8MxRff6nVs
  xBmenqFvMXtLPYrH/ipcDk8e3r5NYPD5vkgtgimLNzEvKr0hgzejfdY6p4KJZxYEvK1gbGG+b
  dDFycQgJtDJJNL6/yw7hHGOU2HDyDBuEc5FRYv/JCaxdjJwcbALuElvv3WcCsUUENCUuNW9jA
  7GZBWwl7l+6w9LFyMEhLOArcaldE6LET2JF+xwWCNtNYv7brewgNouAqsTKiVfZQcp5Bbwltk
  6CWnWTUeLVpz5mkBpOAQOJbZ82gNUzCqhI7Lq7hRFilbjErSfzwU6QEBCReHjxNBuELSrx8vE
  /sDNFBeQlnl64yw4R15E4e/0JI4RtILF16T4WCFtB4ure7SwQM6skdjYfB7N5BQQlTs58wjKB
  UXwWknWzkJTNQlIGEdeUaN3+mx3C1pZYtvA18yxoqOy/uhLKNpV4ffQjI4StKDGl+yH7AkaOV
  YyWSUWZ6RkluYmZObqGBga6hobGuga6RiYmeolVuol6qaW6yal5JUWJQFm9xPJiveLK3OScFL
  281JJNjMCYTylk+LKDcc3y9EOMkhxMSqK8ey/dihHiS8pPqcxILM6ILyrNSS0+xCjDwaEkwWt
  1GygnWJSanlqRlpkDTD4waQkOHiURXlaQNG9xQWJucWY6ROoUoyXHgUUP5zJzHPwOIo9MfDaX
  WYglLz8vVUqc99UtoAYBkIaM0jy4cbAEeYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK8My
  FqezLwSuK2vgA5iAjrIMhPsoJJEhJRUA6PfH6Edn85fcCtSqeM6Kfrs83n9mMAeRUGZK6GlRy
  4sWb3hqH+Pb+n5zNYzUxc2p++N2r9//eOaI19yEz6d0mrxk2Oe/olvxft91pvtTM/vn3TSpT/
  8fmXKn+IP18R5WXhY39drSczv2HtpnV+wpw37w/PCD1/ZtIr/uiHIVXS0tdD3F8tSd3slluKM
  REMt5qLiRACexqmTiwMAAA==
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-11.tower-226.messagelabs.com!1557847255!5802055!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26595 invoked from network); 14 May 2019 15:20:55 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-226.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2019 15:20:55 -0000
Received: from R01UKEXCASM121.r01.fujitsu.local (ex2k13_121.fs.fujitsu.com [10.183.43.173])
        by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id x4EFKth5030192
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
        Tue, 14 May 2019 16:20:55 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 14 May 2019 16:20:54 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c])
 by R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c%22]) with
 mapi id 15.00.1395.000; Tue, 14 May 2019 16:20:54 +0100
From:   "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
To:     "tony@atomide.com" <tony@atomide.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: Kernel Oops when something is executed from within the initramfs
Thread-Topic: Kernel Oops when something is executed from within the initramfs
Thread-Index: AQHVBw9UinRRwm1BC0G6WBfKA16jQ6ZkYbWAgAS19ICAAB2zgIABfQAA
Date:   Tue, 14 May 2019 15:20:54 +0000
Message-ID: <15ad78802c0c78b0766cdda4e34caecfec054800.camel@ts.fujitsu.com>
References: <50042d920efa281582ed8b5486ea89456ad4de65.camel@ts.fujitsu.com>
         <20190510145441.GU8007@atomide.com>
         <e22ceb01c9f2d9136e44475962d570af0d489d7a.camel@ts.fujitsu.com>
         <20190513163715.GW8007@atomide.com>
In-Reply-To: <20190513163715.GW8007@atomide.com>
Accept-Language: de-DE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.32.1-2 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.183.43.93]
Content-Type: multipart/signed; micalg=sha-1;
        protocol="application/x-pkcs7-signature"; boundary="=-1olLWG+QD9GI0vMFK+Xy"
MIME-Version: 1.0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--=-1olLWG+QD9GI0vMFK+Xy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for all help.
I gave up on 4.4.179 ... but succeeded to rebase to 5.1 which is much bette=
r so ;).

Cheers,
Thilo

Am Montag, den 13.05.2019, 09:37 -0700 schrieb Tony Lindgren:
> Hi,
>=20
> * thilo.cestonaro@ts.fujitsu.com <thilo.cestonaro@ts.fujitsu.com> [190513=
 14:51]:
> > Hi Tony,
> >=20
> > thanks for your answer. Sadly it's not an overlapping issue.
> > I even printed the first four and the last four bytes of the initramfs =
before the kernel decompresses it,
> > so I can be sure. And the bytes fit the bytes of my initramfs.
>=20
> OK
>=20
> > Any other hint why I can't execute anything from within the initramfs?
>=20
> Maybe check with current mainline Linux kernel and beaglebone
> that initramfs behaves and then narrow it down from there?
>=20
> Regards,
>=20
> Tony

--=-1olLWG+QD9GI0vMFK+Xy
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
hkgOoYzyLx/4VV1JYzoAAAAAAAA=


--=-1olLWG+QD9GI0vMFK+Xy--
